mkdir workspace-gh
cd workspace-gh

echo "Cloning Content Repository"
mkdir content
cd content
git clone git@github.com:sujeet-pro/design-problems.git
git clone git@github.com:sujeet-pro/dot-files.git
git clone git@github.com:sujeet-pro/notes.git
git clone git@github.com:sujeet-pro/paramanu.git
git clone git@github.com:sujeet-pro/personal-notes.git
git clone git@github.com:sujeet-pro/system-setup.git
git clone git@github.com:sujeet-pro/sujeet-pro.github.io.git
cd ..

echo "Cloning Java Repository"
mkdir java-lang
cd java-lang
git clone git@github.com:sujeet-pro/dsa-java.git

cd ..

echo "Cloning Javascript Repository"
mkdir js-lang
cd js-lang
git clone git@github.com:sujeet-pro/aws-cloudfront-interceptors.git
git clone git@github.com:sujeet-pro/benchmarking.git
git clone git@github.com:sujeet-pro/code-samples.git
git clone git@github.com:sujeet-pro/collections.git
git clone git@github.com:sujeet-pro/dsa-js.git
git clone git@github.com:sujeet-pro/reactivity.git
git clone git@github.com:sujeet-pro/ts-oop-design-pattern.git
cd ..

echo "Cloning Node Repository"
mkdir node-svc
cd node-svc
git clone git@github.com:sujeet-pro/image-optimisation-service.git
git clone git@github.com:sujeet-pro/template-node-express.git

cd ..

echo "Cloning Python Repository"
mkdir python-lang
cd python-lang
git clone git@github.com:sujeet-pro/dsa-python.git
git clone git@github.com:sujeet-pro/uitlity-scripts.git
cd ..

echo "Cloning React UI Repository"
mkdir react-ui
cd react-ui
git clone git@github.com:sujeet-pro/interview-questions-react.git
git clone git@github.com:sujeet-pro/next14-tutorial.git
git clone git@github.com:sujeet-pro/template-react-csr.git
git clone git@github.com:sujeet-pro/ui-challenges-react.git

cd ..

echo "Cloning UI Repository"
mkdir ui
cd ui
git clone git@github.com:sujeet-pro/ui-features.git
git clone git@github.com:sujeet-pro/ui-challenges-vanilla.git
git clone git@github.com:sujeet-pro/v3.sujeet.pro.git
cd ..

echo "Cloning SQL Repository"
mkdir sql-lang
cd sql-lang
git clone git@github.com:sujeet-pro/sql-queries.git
cd ..
