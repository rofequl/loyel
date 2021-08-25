<template>
  <div class="container-fluid p-0">
    <div class="dashboard-title">
      <h4><i class="fa fa-tasks mr-2"></i>Account Managements</h4>
    </div>
    <div class="clearfix"></div>
    <div class="section-wrapper">
      <a-card class="user-details" :body-style="{padding: '4px'}">
        <a-row :gutter="16">
          <a-col class="gutter-row" :md="6">
            <a-row :gutter="16">
              <a-col :xs="12" :md="24">
                <p class="text-primary p-2 mb-2 pointer" :class="{'active' : current === 1}" @click="current = 1">
                  Vacation
                  Mode</p>
              </a-col>
              <a-col :xs="12" :md="24">
                <p class="text-primary p-2 mb-2 pointer" :class="{'active' : current === 2}" @click="current = 2">Change
                  Password</p>
              </a-col>
            </a-row>
          </a-col>
          <a-col class="gutter-row border-left" :md="18">
            <Vacation v-if="current === 1"/>
            <ChangePassword v-if="current === 2"/>
          </a-col>
        </a-row>
      </a-card>
    </div>
  </div>
</template>

<script>
import Vacation from "@/components/seller/account/manage/Vacation";
import ChangePassword from "@/components/seller/account/manage/ChangePassword";

export default {
  components: {Vacation, ChangePassword},
  name: "AccountManage",
  data() {
    return {
      current: 1
    }
  },
}
</script>

<style scoped>
.active {
  background-color: #e1d3d5;
  border-radius: 5px;
  color: #997070 !important;
}
</style>
