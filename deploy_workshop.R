library(googleComputeEngineR)

project = "scpworkshop"
gce_global_project(project)
gce_global_zone("us-central1-a")

## see gce_list_machinetype() for options of predefined_type
(tag = "gcr.io/scpworkshop/bis2019_sc:alpha")

# vm <- gce_vm(template = "rstudio",
#              name = "sc-config",
#              disk_size_gb = 300,
#              predefined_type = "n1-standard-2",
#              dynamic_image = tag,
#              user = "rstudio",
#              password = Sys.getenv("DOCKER_PWD"))

vm <- gce_vm(template = "rstudio",
             name = "sc",
             disk_size_gb = 300,
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