import { readSoup, evaluateStepString, SoupSemantics, SoupDependentSemantics } from 'soup';

import { STR2TR, StepSynchronousProductSemantics, dfs_hashset_predicate_mc_full, ndfs_gs09_cdlp05 } from 'z2mc';
import { z2mcSemanticsAdaptor, z2mcDependentSemanticsAdaptor } from './z2mc-adaptors.js';

import util from 'util';
import { readFile } from 'fs/promises';
import { basename } from 'path';

async function fromFile(filePath) {
  try {
    return await readFile(filePath, 'utf8');
  } catch (error) {
    console.error(`Error reading file from disk: ${error}`);
  }
}

async function soupFromFile(filePath) {
  return fromFile(filePath).then(readSoup);
}

//safety or buchi?
const isBuchi = process.argv[2] === 'buchi';

//read the model
const soup = await soupFromFile(process.argv[3]);
//instantiate the model semantics
const soupSemantics = new SoupSemantics(soup);
//adapt to z2mc
const z2mcSemantics = new z2mcSemanticsAdaptor(soupSemantics);

//read the property
const property = await soupFromFile(process.argv[4]);

//instantiate the Soup semantics
const propertySemantics = new SoupDependentSemantics(property);
//adapt to z2mc
const z2mcDependentSemantics = new z2mcDependentSemanticsAdaptor(propertySemantics, (c) => !c.lookup('status'));

console.log(isBuchi? 'Buchi-verification' : 'Safety-verification', 'Model: ', basename(process.argv[3]), 'Property: ', basename(process.argv[4]));

//compose the model and the property
const composedSemantics = new StepSynchronousProductSemantics(z2mcSemantics, z2mcDependentSemantics);

//convert to TR
const tr = new STR2TR(composedSemantics);

if (isBuchi) {
  const start = performance.now();

  //model check
  const result = await ndfs_gs09_cdlp05(
      await tr.initial(), (c) => tr.next(c), (c) => c,
      (c) => tr.isAccepting(c),
      (c) => tr.configurationHashFn(c), (a, b) => tr.configurationEqFn(a, b));
  
  const end = performance.now();

  console.log(util.inspect(result, { depth: null, colors: true }));

  console.log(`Execution time: ${end - start} ms`);
} else {
  const start = performance.now();

  //model check
  const result = await dfs_hashset_predicate_mc_full(
      tr,
      (c) => c,
      (c) => tr.isAccepting(c),
      (c) => tr.configurationHashFn(c), (a, b) => tr.configurationEqFn(a, b));

  const end = performance.now();
  console.log(util.inspect(result, { depth: null, colors: true }));

  console.log(`Execution time: ${end - start} ms`);
  
}


