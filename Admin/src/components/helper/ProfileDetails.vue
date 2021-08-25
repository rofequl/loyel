<template>
  <a-card style="width: 100%">
    <a-card-meta :title="profile.name">
      <template slot="description">
        <p class="ellipsis">{{ profile.email }}</p>
        <p>{{ profile.mobile }}</p>
      </template>
      <a-avatar size="large"
                slot="avatar"
                :src="profile.photo_type === 0? showImage(profile.photo):profile.photo"
      />
    </a-card-meta>
    <hr/>
    <p class="mb-1"><span style="color: #818181">Customer Id: </span>{{ profile.customer_id }}</p>
    <p class="ellipsis mb-1"><span style="color: #818181">Username: </span>{{ profile.username }}</p>
    <p class="mb-1" v-if="profile.birthday"><span style="color: #818181">Birthday: </span>{{ profile.birthday }}
    </p>
    <p class="mb-1" v-if="profile.gender"><span style="color: #818181">Gender: </span>{{ profile.gender }}</p>
    <p class="mb-1"><span
        style="color: #818181">Member since: </span>{{ moment(profile.created_at).format('MMM Do, YYYY') }}
    </p>
    <p class="mb-1"><span style="color: #818181">Status: </span>
      <a-tag v-if="profile.status === 1">Active</a-tag>
      <a-tag v-else>Block</a-tag>
    </p>
    <p class="mb-1"><span style="color: #818181">User Type: </span>
      <a-tag v-if="profile.user_type === 0 || profile.user_type === 3">Customer</a-tag>
      <a-tag v-if="profile.user_type === 2 || profile.user_type === 3">Seller</a-tag>
    </p>
    <p class="mb-1"><span style="color: #818181">Verify: </span>
      <a-tag v-if="profile.email_verify === 1">Email</a-tag>
      <a-tag v-if="profile.mobile_verify === 1">Mobile</a-tag>
      <a-tag v-if="profile.seller_verify === 1">Seller</a-tag>
    </p>
  </a-card>
</template>

<script>
export default {
  name: "ProfileDetails",
  props: {
    profile: {
      required: true
    },
  }
}
</script>

<style scoped>

</style>
