# for ubuntu

mkdir -p .codex/mcp
git clone https://github.com/zcaceres/markdownify-mcp.git .codex/mcp/markdownify-mcp
cd .codex/mcp/markdownify-mcp

pnpm install
pnpm run build
