<!-- DOCSIBLE START -->

# 📃 Role overview

## node_exporter




Description: Not available.

| Field                | Value           |
|--------------------- |-----------------|
| Readme update        | 16/05/2025 |














### Tasks


#### File: tasks/darwin.yml

| Name | Module | Has Conditions |
| ---- | ------ | --------- |
| Install node_exporter via Homebrew (macOS) | homebrew | False |
| Enable node_exporter via brew services | ansible.builtin.command | False |

#### File: tasks/linux.yml

| Name | Module | Has Conditions |
| ---- | ------ | --------- |
| Set Node Exporter version | ansible.builtin.set_fact | False |
| Create node_exporter user | ansible.builtin.user | False |
| Download node_exporter binary | ansible.builtin.get_url | False |
| Extract node_exporter | ansible.builtin.unarchive | False |
| Symlink binary to /usr/local/bin | ansible.builtin.file | False |
| Copy systemd service unit | ansible.builtin.template | False |
| Enable and start node_exporter | ansible.builtin.systemd | False |

#### File: tasks/main.yml

| Name | Module | Has Conditions |
| ---- | ------ | --------- |
| Set Node Exporter version | set_fact | False |
| Include OS-specific tasks | include_tasks | False |


## Task Flow Graphs



### Graph for darwin.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Install_node_exporter_via_Homebrew__macOS_0[install node exporter via homebrew  macos ]:::task
  Install_node_exporter_via_Homebrew__macOS_0-->|Task| Enable_node_exporter_via_brew_services1[enable node exporter via brew services]:::task
  Enable_node_exporter_via_brew_services1-->End
```


### Graph for linux.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Set_Node_Exporter_version0[set node exporter version]:::task
  Set_Node_Exporter_version0-->|Task| Create_node_exporter_user1[create node exporter user]:::task
  Create_node_exporter_user1-->|Task| Download_node_exporter_binary2[download node exporter binary]:::task
  Download_node_exporter_binary2-->|Task| Extract_node_exporter3[extract node exporter]:::task
  Extract_node_exporter3-->|Task| Symlink_binary_to__usr_local_bin4[symlink binary to  usr local bin]:::task
  Symlink_binary_to__usr_local_bin4-->|Task| Copy_systemd_service_unit5[copy systemd service unit]:::task
  Copy_systemd_service_unit5-->|Task| Enable_and_start_node_exporter6[enable and start node exporter]:::task
  Enable_and_start_node_exporter6-->End
```


### Graph for main.yml

```mermaid
flowchart TD
Start
classDef block stroke:#3498db,stroke-width:2px;
classDef task stroke:#4b76bb,stroke-width:2px;
classDef includeTasks stroke:#16a085,stroke-width:2px;
classDef importTasks stroke:#34495e,stroke-width:2px;
classDef includeRole stroke:#2980b9,stroke-width:2px;
classDef importRole stroke:#699ba7,stroke-width:2px;
classDef includeVars stroke:#8e44ad,stroke-width:2px;
classDef rescue stroke:#665352,stroke-width:2px;

  Start-->|Task| Set_Node_Exporter_version0[set node exporter version]:::task
  Set_Node_Exporter_version0-->|Include task| Include_OS_specific_tasks____ansible_system___lower____yml_1[include os specific tasks<br>include_task:    ansible system   lower    yml]:::includeTasks
  Include_OS_specific_tasks____ansible_system___lower____yml_1-->End
```







#### Dependencies

No dependencies specified.
<!-- DOCSIBLE END -->
