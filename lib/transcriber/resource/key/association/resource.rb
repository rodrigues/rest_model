class Transcriber::Resource::Association
  module Resource
    def to_resource(parent)
      return {} if !present?(parent)
      {:rel => name, :href => ""}
    end
  end
end
