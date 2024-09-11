-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil 

DEFAULT_ANVIL_KEY :=[ANVIL_KEY]

all:  remove install build

clean  :; forge clean

remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std --no-commit

update:; forge update

build:; forge build

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

coverage-report :; forge coverage --report debug > coverage-report.txt

slither :; slither . --config-file slither.config.json 

aderyn :; aderyn .