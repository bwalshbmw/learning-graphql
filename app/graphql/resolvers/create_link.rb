class Resolvers::CreateLink < GraphQL::Function
  # Argumnets passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  # Return type from the mutation
  type Types::LinkType

  # The mutation method
  def call(obj, args, ctx)
    Link.create!(
      description: args[:description],
      url: args[:url],
      user: ctx[:current_user]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(
      "Invalid input: #{e.record.errors.full_messages.join(', ')}"
    )
  end
end
