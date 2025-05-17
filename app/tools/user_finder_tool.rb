class UserFinderTool < RubyLLM::Tool
  description <<~DESCRIPTION 
    Find a user by their name. The user will be returned as a JSON object. The payload returns:
    - id: The user's ID
    - name: The user's name
    - interests: The user's interests
    - email: The user's email
    - created_at: The user's creation date
  DESCRIPTION

  param :name,
        type: :string,
        desc: "The name of the user to search for"

  def execute(name:)
    user = User.find_by("name ILIKE ?", "%#{name}%")
    return "User not found" unless user

    user.to_json
  end
end
