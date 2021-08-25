<template>
  <CFooter :fixed="false">
    <div class="ml-1" v-html="$store.getters.footerList.copyright"></div>
    <div class="mfs-auto">
      <span class="mr-1" target="_blank">Developed by</span>
      <a href="http://uniteditbd.com/">United IT</a>
    </div>
  </CFooter>
</template>

<script>
export default {
  name: "Footer"
}
</script>

<style scoped>
p {
  margin-bottom: 0 !important;
}
</style>
