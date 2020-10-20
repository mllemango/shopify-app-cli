module Theme
  module Commands
    class Generate
      class Env < ShopifyCli::SubCommand
        options do |parser, flags|
          parser.on('--env=ENV') { |env| flags[:env] = env }
        end

        def call(*)
          store = ask_store
          password = ask_password
          themeid = ask_theme(store: store, password: password)
          env = options.flags[:env]

          Themekit.generate_env(@ctx, store: store, password: password, themeid: themeid, env: env)
        end

        def self.help
          ShopifyCli::Context.message('theme.generate.env.help', ShopifyCli::TOOL_NAME)
        end

        private

        def ask_password
          CLI::UI::Prompt.ask('password')
        end

        def ask_theme(store:, password:)
          themes = Themekit.query_themes(@ctx, store: store, password: password)

          CLI::UI::Prompt.ask("Select theme") do |handler|
            themes.each do |name, id|
              handler.option(name) { id }
            end
          end
        end

        def ask_store
          CLI::UI::Prompt.ask('store')
        end
      end
    end
  end
end
