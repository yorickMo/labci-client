# ci_apiclient

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deployment

to build a container, use the Github workflow included. 

also, make sure secret variables are configured in your repository:

- AWS_REGION: 
- GCR_DEVOPS_SERVICE_ACCOUNT_KEY: json key with access to GCR in your GCP project. Advise: create a new, limited user before you create the service credentials..
- IMAGE_URL: url of the image that should be used as background image. Warning: make sure CORS is configured...
- PROJECT_ID: gcp project ID. Warning: this is not the same as the project name...

