#!/usr/bin/env zx
import path from 'path';

$.verbose = false;

let args = process.argv.slice(process.argv[1].endsWith("/zx") ? 2 : 1);

if (args.length !== 2) {
    console.log(`Usage: ${args[0]} <name>`);
    process.exit();
}

let name = args[1];

console.log(`creating module: ${name}`);

const modname = name => {
    let mod = name
    let pwd = process.cwd();
    if (pwd.includes("/src/")) {
        mod = pwd.replace(/.+\/src\/(.+)/, `$1/${name}`);
    }
    return path.normalize(mod);
}
let mod = modname(name);
let goVersion = (await $`go env GOVERSION`).toString().trim().replace(/^go(\d+\.\d+)(\.\d+)?/, "$1");

await $`mkdir -p ${name}`;
await cd(name);
await $`{
    echo module ${mod};
    echo;
    echo go ${goVersion}
} > go.mod`
await $`git init`
await $`echo '# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with \`go test -c\`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

# Jetbrains IDE
.idea/' > .gitignore`
await $`.ONESHELL:
SHELL:=bash
.PHONY: build

' > Makefile`
