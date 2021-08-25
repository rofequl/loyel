<template>
  <div class="container-fluid p-0">
    <div class="dashboard-title">
      <h4><i class="fa fa-dashcube mr-2"></i>Dashboard</h4>
    </div>
    <div class="section-wrapper">
      <a-alert class="mb-4" v-if="!isSellerAccess"
          message="Your account is not verified. That's why you can't upload product and manage everything"
          type="warning"
          closable
      />
      <div class="loyel-card">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-12 mb-4">
            <div class="card-item">
              <div class="card-body">
                <h3>0</h3>
                <p>Total Product</p>
              </div>
              <div class="card-footer">
                <router-link to="/seller/product-list"><span>More info</span><span><i
                    class="fa fa-arrow-circle-right"></i></span></router-link>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12 mb-4">
            <div class="card-item">
              <div class="card-body">
                <h3>0</h3>
                <p>Total Orders</p>
              </div>
              <div class="card-footer">
                <a href="#0"><span>More info</span><span><i class="fa fa-arrow-circle-right"></i></span></a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12 mb-4">
            <div class="card-item">
              <div class="card-body">
                <h3>0</h3>
                <p>Total Order</p>
              </div>
              <div class="card-footer">
                <a href="#0"><span>More info</span><span><i class="fa fa-arrow-circle-right"></i></span></a>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12 mb-4">
            <div class="card-item">
              <div class="card-body">
                <h3>0</h3>
                <p>Total Earnings</p>
              </div>
              <div class="card-footer">
                <a href="#0"><span>More info</span><span><i class="fa fa-arrow-circle-right"></i></span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a-row :gutter="16">
        <a-col :md="16">
          <a-card title="Orders">
            <a-list size="large">
              <a-list-item>
                Total orders:
                <div class="float-right">0</div>
              </a-list-item>
              <a-list-item>
                Pending orders:
                <div class="float-right">0</div>
              </a-list-item>
              <a-list-item>
                Cancelled orders:
                <div class="float-right">0</div>
              </a-list-item>
              <a-list-item>
                Successful orders:
                <div class="float-right">0</div>
              </a-list-item>
            </a-list>
          </a-card>
        </a-col>
        <a-col :md="8">
          <CompleteStep/>
        </a-col>
      </a-row>
    </div>
  </div>
</template>

<script>
import CompleteStep from "@/components/seller/dashboard/CompleteStep";
import {mapGetters} from "vuex";

export default {
  components: {CompleteStep},
  name: "Dashboard",
  computed: {
    ...mapGetters(["isSellerAccess"])
  },
}
</script>

<style scoped>

</style>
