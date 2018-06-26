require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "#index" do
    it "returns the todos" do
      todo = Todo.create!(description: "this is a todo")
      get :index
      expect(assigns[:todos]).to eq([todo])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "#show" do
    it "returns a todo" do
      todo = Todo.create!(description: "this is a todo")
      get :show, params: {id: todo.id}
      expect(assigns[:todo]).to eq(todo)
    end
    it "renders the show template" do
      todo = Todo.create!(description: "this is a todo")
      get :show, params: {id: todo.id}
      expect(response).to render_template(:show)
    end
  end
end
