#!/bin/bash
# ==================================================================
# Source Recipes
# This file simply takes a list and converts it to a list of source
# commands for each recipe
# ==================================================================

# Source Recipes(array:list of apps){return array:list of source commands}
# ---------------------------------------------------------------------
source_recipes() {
  local app_list=$@
  local pre_source="source '${DIR}/recipes/"
  local post_source=".sh'"

  for app in $app_list[]; do
    sourced_recipes+=("$pre_source$app/$app$post_source")
  done
}

# Source Recipe Configurations(array:list of apps){return array:list of source commands}
# ---------------------------------------------------------------------
source_recipe_configs() {
  local app_list=$@
  local pre_source="source '${DIR}/recipes/"
  local post_source=".cfg'"

  for app in $app_list[]; do
    sourced_recipe_configs+=("$pre_source$app/$app$post_source")
  done
}

# Source All Recipes(){return array:list of source commands}
# ---------------------------------------------------------------------
source_all_recipes() {
  local app_list=$(ls -m ${DIR}recipes/*/*.sh)
  local pre_source="source '${DIR}/recipes/"
  local post_source="'"

  for app in $app_list[]; do
    sourced_recipes+=("$pre_source$app/$app$post_source")
  done
}

# Source All Recipe Configurations(){return array:list of source commands}
# ---------------------------------------------------------------------
source_all_recipe_configs() {
  local app_list=$(ls -m ${DIR}recipes/*/*.cfg)
  local pre_source="source '${DIR}/recipes/"
  local post_source="'"

  for app in $app_list[]; do
    sourced_recipe_configs+=("$pre_source$app/$app$post_source")
  done
}