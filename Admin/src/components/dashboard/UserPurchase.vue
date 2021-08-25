<template>
  <div>
    <CRow>
      <CCol md="12">
        <CCard>
          <CCardHeader>
            Latest order list
          </CCardHeader>
          <CCardBody>
            <CDataTable
                class="mb-0 table-outline"
                hover
                :items="latestOrder"
                :fields="tableFields"
                head-color="light"
                no-sorting
            >
              <td slot="avatar" class="text-center" slot-scope="{item}">
                <div class="c-avatar">
                  <img :src="showImage(item.avatar)" class="c-avatar-img" alt="">
                </div>
              </td>
              <td slot="user" slot-scope="{item}">
                <div>{{ item.user_name }}</div>
                <div class="small text-muted">
                  <span>
                  </span> Registered: {{ moment(item.registered).format('d MMM, y') }}
                </div>
              </td>
              <td slot="order_code" slot-scope="{item}">
                <strong>#{{item.order_code}}</strong>
              </td>
              <td slot="order" slot-scope="{item}">
                <div class="clearfix">
                  <div class="float-left">
                    <a-tag v-if="item.payment_status === 0" color="#f50">
                      Unpaid
                    </a-tag>
                    <a-tag v-else color="#23aa49">
                      Paid
                    </a-tag><br>
                    <small class="text-muted">{{item.no_of_product}} product order</small>
                  </div>
                  <div class="float-right text-center">
                    <a-tag v-if="item.delivered_status === 0" color="#8c6b73">Pending</a-tag>
                    <a-tag v-else-if="item.delivered_status === 1" color="#23aa49">Confirmed</a-tag>
                    <a-tag v-else-if="item.delivered_status === 2" color="#81309c">On Delivery</a-tag>
                    <a-tag v-else-if="item.delivered_status === 3" color="#2379e4">Delivery</a-tag>
                    <a-tag v-else color="#f50">Cancel</a-tag><br>
                    <strong>{{ numberWithCommas(item.total) }}</strong>
                  </div>
                </div>
              </td>
              <td
                  slot="payment"
                  slot-scope="{item}"
                  class="text-center">
                <a-tooltip placement="top" v-if="item.payment_type === 1">
                  <template slot="title">
                    <span>Cash on Delivery</span>
                  </template>
                  <strong>COD</strong>
                </a-tooltip>
              </td>
              <td slot="activity" slot-scope="{item}">
                <div class="small text-muted">Order time:</div>
                <strong>{{ moment(item.created_at).calendar() }}</strong>
              </td>
            </CDataTable>
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  </div>
</template>

<script>

export default {
  props: ['latestOrder'],
  name: "UserPurchase",
  data() {
    return {
      tableFields: [
        {key: 'avatar', label: '', _classes: 'text-center'},
        {key: 'user'},
        {key: 'order_code'},
        {key: 'order'},
        {key: 'payment', label: 'Payment method', _classes: 'text-center'},
        {key: 'activity'},
      ]
    }
  },
  methods: {
    color(value) {
      let $color
      if (value <= 25) {
        $color = 'info'
      } else if (value > 25 && value <= 50) {
        $color = 'success'
      } else if (value > 50 && value <= 75) {
        $color = 'warning'
      } else if (value > 75 && value <= 100) {
        $color = 'danger'
      }
      return $color
    }
  }
}
</script>

<style scoped>

</style>
