<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Setup & Configurations
        </span>
        <h3 class="page-title">Frequently Asked Questions</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <a-tabs default-active-key="3">
      <a-tab-pane key="1" tab="Question Category">
        <HelpCategory/>
      </a-tab-pane>
      <a-tab-pane key="2" tab="Question Subcategory">
        <help-subcategory/>
      </a-tab-pane>
      <a-tab-pane key="3" tab="Questions">
        <question/>
      </a-tab-pane>
    </a-tabs>
  </div>
</template>

<script>
import HelpCategory from "@/components/setup/pages/faq/HelpCategory";
import HelpSubcategory from "@/components/setup/pages/faq/HelpSubcategory";
import Question from "@/components/setup/pages/faq/Question";

export default {
  name: "Faq",
  components: {HelpCategory, HelpSubcategory, Question}
}
</script>

<style scoped>

</style>
