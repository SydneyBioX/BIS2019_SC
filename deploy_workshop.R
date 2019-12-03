library(googleComputeEngineR)

project = "scpworkshop"
gce_global_project(project)


## see gce_list_machinetype() for options of predefined_type
(tag = "gcr.io/scpworkshop/bis2019_sc:alpha")


gce_global_zone("us-central1-a")
vm1 <- gce_vm(template = "rstudio",
             name = "sc1",
             disk_size_gb = 500,
             predefined_type = "n1-standard-32",
             dynamic_image = tag,
             user = "rstudio",
             password = Sys.getenv("DOCKER_PWD"))

gce_global_zone("us-west2-a")
vm2 <- gce_vm(template = "rstudio",
             name = "sc2",
             disk_size_gb = 500,
             predefined_type = "n1-standard-32",
             dynamic_image = tag,
             user = "rstudio",
             password = Sys.getenv("DOCKER_PWD"))


# vm = gce_ssh_setup(vm,
#                    username = "rstudio",
#                    key.pub = "~/.ssh/id_rsa.pub",
#                    key.private = "~/.ssh/id_rsa")
# 
# gce_push_registry(vm, 
#                   save_name = "my_rstudio",
#                   container_name = "rstudio")