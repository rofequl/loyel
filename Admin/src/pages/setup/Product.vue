<template>
  <div>
    <a-tabs default-active-key="1">
      <a-tab-pane key="1" tab="Unit">
        <Unit/>
      </a-tab-pane>
      <a-tab-pane key="2" tab="Colour">
        <Color/>
      </a-tab-pane>
    </a-tabs>
  </div>
</template>

<script>
import Unit from "@/components/setup/product/Unit";
import Color from "@/components/setup/product/Color";

export default {
  name: "Product",
  components: {Color, Unit}
}
</script>

<style scoped>

</style>
