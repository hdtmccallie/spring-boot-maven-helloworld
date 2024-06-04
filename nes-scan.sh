#!/bin/bash

set -e

# Configuration Variables
# GITHUB_TOKEN="$GITHUB_TOKEN"
# REPOSITORY="neverendingsupport/spring-boot"
# GROUP_ID="com.herodevs.nes.springframework.boot"
# ARTIFACT_ID="spring-boot"
# VERSION="2.7.18-spring-boot-2.7.19-trial2"

# ARTIFACT_PATH="$GROUP_ID/$ARTIFACT_ID/$VERSION"

# https://maven.pkg.github.com/neverendingsupport/spring-boot/com.herodevs.nes.springframework.boot.spring-boot-actuator/2.7.18-spring-boot-2.7.19-trial2/com.herodevs.nes.springframework.boot.spring-boot-actuator-2.7.18-spring-boot-2.7.19-trial2.jar
# https://maven.pkg.github.com/neverendingsupport/spring-boot/com.herodevs.nes.springframework.boot/spring-boot-actuator/2.7.18-spring-boot-2.7.19-trial2/com.herodevs.nes.springframework.boot.spring-boot-actuator-2.7.18-spring-boot-2.7.19-trial2.jar

# SonarCloud Configuration
# SONAR_PROJECT_KEY="<SONAR_PROJECT_KEY>"
# SONAR_ORG_KEY="<SONAR_ORG_KEY>"
# SONAR_TOKEN="<SONAR_TOKEN>"

# Snyk Configuration
SNYK_TOKEN="$SNYK_MY_TOKEN"
SNYK_ORG_ID="66758868-3558-4cda-b694-f1fa5f1c264f"
# SNYK_ORG_ID="8f8b7fc3-474a-41e5-931a-231c96af0383"



# ARTIFACT_FILE="$ARTIFACT_ID-$VERSION.pom"
DEST_FILE="pom.xml"
# GITHUB_URL="https://maven.pkg.github.com/$REPOSITORY/$ARTIFACT_PATH/$ARTIFACT_FILE"
# echo "Downloading $GITHUB_URL"
# curl -H "Authorization: token $GITHUB_TOKEN" -L $GITHUB_URL -o "$DEST_FILE"

# ARTIFACT_FILE="$ARTIFACT_ID-$VERSION.jar"
# GITHUB_URL="https://maven.pkg.github.com/$REPOSITORY/$ARTIFACT_PATH/$ARTIFACT_FILE"
# echo "Downloading $GITHUB_URL"
# curl -H "Authorization: token $GITHUB_TOKEN" -L $GITHUB_URL -o "$ARTIFACT_FILE"


# # SonarCloud Scan
# echo "Running SonarCloud scan..."
# sonar-scanner \
#   -Dsonar.projectKey=$SONAR_PROJECT_KEY \
#   -Dsonar.organization=$SONAR_ORG_KEY \
#   -Dsonar.sources=. \
#   -Dsonar.host.url="https://sonarcloud.io" \
#   -Dsonar.login=$SONAR_TOKEN

# Snyk Scan
echo "Running Snyk scan..."
snyk --org="$SNYK_ORG_ID" auth $SNYK_TOKEN
snyk --org="$SNYK_ORG_ID" monitor --scan-unmanaged --project-name=tm-maven-comparison  --file=$DEST_FILE --package-manager=maven
# --json-file-output=scan_${DEST_FILE}.json
# cat scan_${DEST_FILE}.json | npx snyk-to-html -o "report_${DEST_FILE}.html"

# # OWASP Dependency Check
# echo "Running OWASP DependencyCheck..."
# dependency-check --project "$PACKAGE_NAME" --out . --scan $ARTIFACT_NAME

# # Optional: OWASP ZAP Security Test
# # echo "Running OWASP ZAP security test..."
# # zap-cli start
# # zap-cli open-url http://your-application-url
# # zap-cli active-scan --recursive http://your-application-url
# # zap-cli report -o zap_report.html
# # zap-cli stop

# # Optional: JaCoCo for Code Coverage (integrate in your build process, not directly executable here)
# # echo "Generating code coverage report with JaCoCo..."

# # Clean up
# echo "Cleaning up..."
# rm $ARTIFACT_NAME

# echo "All scans and checks complete."