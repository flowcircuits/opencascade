SKIP_DOCKER=false

for arg in "$@"
do
    case $arg in
        --skip-docker)
        SKIP_DOCKER=true
        shift
        ;;
    esac
done

if [ "$SKIP_DOCKER" = false ]; then
    docker run \
        --rm \
        -it \
        -v "$(pwd):/src" \
        -u "$(id -u):$(id -g)" \
        donalffons/opencascade.js \
        config.yml
fi

babel index.js --out-file index.cjs
rm -rf dist
mkdir dist
mv index.* dist
