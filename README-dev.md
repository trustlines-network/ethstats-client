# Developer Documentation

## Release Checklist

0. Prerequisite: The `master` branch contains the version to be
   released
1. Open and merge a PR `master` -> `pre-release` without waiting for
   a review, which will push a new image to Docker Hub under the
   name `netstats-client-next:pre-release`.
2. Test the `pre-release`:
   - Pull the new image from Docker Hub.
   - Run the netstats client in a pre-existing environment set up
     using the quickstart script and check that it reports properly
     to the netstats page.
3. Open a PR `pre-release` -> `release`, wait for a review confirming
   that the necessary testing steps have been performed, and merge
   it.
4. Authorize the release in CircleCI.
5. Check that the image is built and pushed to Docker Hub under
   `trustlines/netstats-client:release`.
6. Merge back the changes from the release branch into master.

