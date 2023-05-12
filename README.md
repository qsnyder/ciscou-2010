# CISCOU-2010

This repository will serve as the codebase for CISCOU-2010 presented at CLUS2023 in Las Vegas.  In this repository are several folders containing Dockerfiles as well as a `Makefile` for instantiation of the appropriate Docker images.

## Usage

Prior to proceeding, each image will need to be built from source.  On a "modern" x86 Mac, this will take several minutes as the Python images use Python which is compiled from source, rather than installed through a repository.  These Python images will need to be built first, as each of the Ansible images depends on a Python image already being built.

## A note on `Makefile`s

All of these container images can be built and run using commands from within the `Makefile` included in the repository.  These commands are just `.PHONY` targets to execute `bash` scripts to simplify the process (rather than lengthy commands).

The `Makefile` does make an assumption on the naming convention of these containers, as the build process will tag them with a prefix (which is my GitHub user ID).  This can be changed in the `Makefile` with no adverse effects, as long as they are changed universally (i.e. if you change the name in the build, ensure that you change the name in the run process as well).

### Building the container images

Each image can be built using the `Makefile` syntax.  This will follow the same for every image, and will mimic the folder names within this repository.  From the root of this repository, run

```bash
make build-{image-name}
```

where `{image-name}` is either `python-3.7`, `python-3.10`, `ansible-2.9`, or `ansible-2.10`.

Keep in mind that the Python images will need to be built prior to the Ansible images.

### Running the container images

Each image can be run using the `Makefile` syntax as well.  This is similar to the build process -- and can be invoked with the following syntax:

```bash
make {image-name}
```

where `{image-name}` is one of the images above.  Each of these `make` targets will perform a volume map (`-v`) to the folder in which the container Dockerfile is housed (i.e. if running the `ansible-2.9` container, it will map a folder in the container, located at `/root/mycode` to the `{repository-directory}/ansible-2.9/` folder.  This behavior can be changed by modifying the `Makefile` target.

## Responses to potential questions

**Ansible 2.9 is long EoL.  Why include it in this repo?**

> This repository serves as a demonstration for the use of containers and how they can be used to provide isolation between current host user-space applications and container applications.  Using Ansible 2.9 provides for an easy visual syntax difference, due to the lack of need for collections to interact with Cisco gear.

**Why did you build the collection in the Ansible 2.10 container as a build step, rather than having the user run it at execution time?**

> I wanted the containers to be self-service at build.  Obviously, if the collection needs to be updated, the image can be deleted and rebuilt, or the collection update mechanism can be invoked when the container is running.

**The Ansible container won't connect via SSH to my device.**

> Use the `-vv` switch during the SSH process from the container and use that to modify the SSH options within the inventory file for that device.

**Your code is terrible**

> I know.  This was for demo purposes.  Use at your own risk in production.
