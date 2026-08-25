##[>] 🤖🤖
{{ localFile ".repo/upstream.env" | alwaysUpdate }}
AI_CONFIGS_REF={{ shell "glab variable get -g konradodwrot GRP_KO_VAR_AI_CONFIGS_REF" }}
ARTIFACT_REGISTRY={{ shell "glab variable get -g konradodwrot GRP_KO_VAR_ARTIFACT_REGISTRY" }}
ARTIFACT_REGISTRY_PROXY_DOCKERHUB={{ shell "glab variable get -g konradodwrot GRP_KO_VAR_ARTIFACT_REGISTRY_PROXY_DOCKERHUB" }}
TAG_TOKEN={{ shell "glab variable get -R konradodwrot/resume-md-pdf REPO_PROTECTED_VAR_BOT_TAG_TOKEN" }}
##[<] 🤖🤖
