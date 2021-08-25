<template>
  <a-card>
    <h5 class="mb-4">Go Live on {{ $store.getters.generalSettings.app_name }}.
      <span v-if="store.details.step > 0"> You are just {{ store.details.step }} steps away!</span>
    </h5>
        <a-timeline>
          <a-timeline-item><span class="text-dark mr-2">Contact Details</span>
            <a-tag color="orange" v-if="checkArray(store.details.complete_step, 1)">COMPLETED</a-tag>
            <a-tag color="red" v-else>PENDING</a-tag>
          </a-timeline-item>
          <a-timeline-item><span class="text-dark mr-2">Store Profile</span>
            <a-tag color="orange" v-if="checkArray(store.details.complete_step, 2)">COMPLETED</a-tag>
            <a-tag color="red" v-else>PENDING</a-tag>
            <p class="text-muted" style="font-size: 12px">Cover image & description for your store on
              {{ $store.getters.generalSettings.app_name }}</p>
          </a-timeline-item>
          <a-timeline-item><span class="text-dark mr-2">Financial Details</span>
            <a-tag color="orange" v-if="checkArray(store.details.complete_step, 3)">COMPLETED</a-tag>
            <a-tag color="red" v-else>PENDING</a-tag>
            <p class="text-muted" style="font-size: 12px">ID Proof & Bank Details to receive payments</p></a-timeline-item>
        </a-timeline>
    <a-button v-if="store.details.step > 0" type="danger" class="btn-block mx-auto"
              @click="$router.push('/seller/store')">
      Complete Pending Steps <i class="ml-2 fa fa-long-arrow-right"></i>
    </a-button>
  </a-card>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "CompleteStep",
  methods: {
    checkArray(e, f) {
      return Object.values(e).indexOf(f) >= 0
    }
  },
  computed: {
    ...mapGetters({store: "userStore"})
  }
}
</script>

<style scoped>

</style>
