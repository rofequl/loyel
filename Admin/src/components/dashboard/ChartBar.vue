<template>
  <CChartBar
      :datasets="defaultDatasets"
      labels="months"
  />
</template>

<script>
import {CChartBar} from '@coreui/vue-chartjs'

export default {
  name: "ChartBar",
  components: {CChartBar},
  computed: {
    defaultDatasets() {
      return [
        {
          label: 'Total Sales',
          backgroundColor: '#f87979',
          data: [40, 20, 12, 39, 10, 40, 39, 80, 40, 20, 12, 11]
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>
