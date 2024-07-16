#!/bin/bash

pnpm install

trap "exit" INT TERM ERR
trap "kill 0" EXIT

# node index.js

# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob0.soup ../soup-js/examples/dependent/exclusion.soup
# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob0.soup ../soup-js/examples/dependent/no-deadlock.soup

# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob1.soup ../soup-js/examples/dependent/exclusion.soup
# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob1.soup ../soup-js/examples/dependent/no-deadlock.soup

# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob2.soup ../soup-js/examples/dependent/no-deadlock.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob2.soup ../soup-js/examples/dependent/buchi_eventuallyOneInCS.soup

# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob2.soup ../soup-js/examples/dependent/buchi_eventuallyOneInCS.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob2.soup ../soup-js/examples/dependent/buchi_fairness.soup

# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob3.soup ../soup-js/examples/dependent/buchi_eventuallyOneInCS.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob3.soup ../soup-js/examples/dependent/buchi_fairness.soup

node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob4.soup ../soup-js/examples/dependent/exclusion.soup
node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob4.soup ../soup-js/examples/dependent/no-deadlock.soup
node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob4.soup ../soup-js/examples/dependent/buchi_eventuallyOneInCS.soup
node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob4.soup ../soup-js/examples/dependent/buchi_fairness.soup
node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob4.soup ../soup-js/examples/dependent/buchi_idling.soup

# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob5.soup ../soup-js/examples/dependent/exclusion.soup
# node z2mc_soup_soup.js safety ../soup-js/examples/alice-bob5.soup ../soup-js/examples/dependent/no-deadlock.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob5.soup ../soup-js/examples/dependent/buchi_eventuallyOneInCS.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob5.soup ../soup-js/examples/dependent/buchi_fairness.soup
# node z2mc_soup_soup.js buchi  ../soup-js/examples/alice-bob5.soup ../soup-js/examples/dependent/buchi_idling.soup
