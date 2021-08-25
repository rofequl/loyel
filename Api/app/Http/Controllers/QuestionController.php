<?php

namespace App\Http\Controllers;

use App\Model\Brand;
use App\Model\General;
use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class QuestionController extends Controller
{
    use FileUpload;
    use Slug;

    public function index(): array
    {
        $question = [];
        $question['category'] = DB::table('help_categories')->get();
        $question['subcategory'] = DB::table('help_subcategories')->join('help_categories', 'help_categories.id', '=', 'help_subcategories.category_id')
            ->select('help_categories.name as category', 'help_subcategories.*')->get();
        $question['question'] = DB::table('help_questions')->get();
        return $question;
    }

    public function store(Request $request): array
    {
        $this->validate($request, [
            'question' => 'required|max:255|unique:help_questions',
            'category_id' => 'required',
            'subcategory_id' => 'required',
        ]);

        $slug = $this->slugText($request, 'question');

        $insert = DB::table('help_questions')->insertGetId([
            'question' => $request->question,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'answer' => $request->answer,
            'slug' => $slug,
        ]);
        return (array)DB::table('help_questions')->where('id', $insert)->first();
    }

    public function update(Request $request, $id): array
    {
        $this->validate($request, [
            'question' => 'required|max:255|unique:help_questions,question,' . $id,
            'category_id' => 'required',
            'subcategory_id' => 'required',
        ]);

        $insert = DB::table('help_questions')->where('id', $id)->update([
            'question' => $request->question,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'answer' => $request->answer,
        ]);
        return (array)DB::table('help_questions')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('help_questions')->where('id', $id)->delete();
    }

    public function storeCategory(Request $request): array
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:help_categories',
            'icon' => 'required',
        ]);

        $logo = $this->saveImagesWH($request, 'icon', 'upload/help/category/', 500, 500);
        $slug = $this->slugText($request, 'name');

        $insert = DB::table('help_categories')->insertGetId([
            'name' => $request->name,
            'icon' => $logo,
            'slug' => $slug,
        ]);
        return (array)DB::table('help_categories')->where('id', $insert)->first();
    }

    public function updateCategory(Request $request, $id): array
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:help_categories,name,' . $id,
            'icon' => 'required',
        ]);

        $category = (array)DB::table('help_categories')->where('id', $id)->first();
        if (strlen($request->icon) > 200) {
            File::delete(base_path('public/' . $category['icon']));
            $icon = $this->saveImagesWH($request, 'icon', 'upload/help/category/', 500, 500);
        } else $icon = $category['icon'];

        DB::table('help_categories')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
                'icon' => $icon,
            ]);
        return (array)DB::table('help_categories')->where('id', $id)->first();
    }

    public function destroyCategory($id)
    {
        $subcategory = DB::table('help_subcategories')->where('category_id', $id)->first();
        if ($subcategory) return response()->json(['result' => 'Error', 'message' => 'Category already used create a subcategory'], 200);
        DB::table('help_categories')->where('id', $id)->delete();
    }

    public function storeSubcategory(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'category_id' => 'required',
        ]);
        if (DB::table('help_subcategories')->where('category_id', $request->category_id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create Sub category'], 422);
        }

        $slug = $this->slugText($request, 'name');

        $insert = DB::table('help_subcategories')->insertGetId([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'slug' => $slug,
        ]);
        return (array)DB::table('help_subcategories')->join('help_categories', 'help_categories.id', '=', 'help_subcategories.category_id')
            ->select('help_categories.name as category', 'help_subcategories.*')->where('help_subcategories.id', $insert)->first();
    }

    public function updateSubcategory(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'category_id' => 'required',
        ]);
        if (DB::table('help_subcategories')->where('category_id', $request->category_id)->where('id', '!=', $id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create Sub category'], 422);
        }

        DB::table('help_subcategories')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
                'category_id' => $request->category_id,
            ]);
        return (array)DB::table('help_subcategories')->join('help_categories', 'help_categories.id', '=', 'help_subcategories.category_id')
            ->select('help_categories.name as category', 'help_subcategories.*')->where('help_subcategories.id', $id)->first();
    }

    public function destroySubcategory($id)
    {
        $subcategory = DB::table('help_questions')->where('subcategory_id', $id)->first();
        if ($subcategory) return response()->json(['result' => 'Error', 'message' => 'Subcategory already used create a Question'], 200);
        DB::table('help_subcategories')->where('id', $id)->delete();
    }

    public function topQuestion(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('help_questions')
            ->where('id', $request->id)
            ->update([
                'status' => (int)$request->active,
            ]);
    }

}
