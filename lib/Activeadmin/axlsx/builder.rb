module Activeadmin
  module Axlsx
    class Builder
      attr_reader :resource_class, :collections

      def initialize(resource_class, collections)
        @resource_class = resource_class
        @collections = collections
        @page = 1
      end

      def call
        [filename, file]
      end

      def file
        ::Axlsx::Package.new do |package|
          loop do
            collections_per_page = collections.page(@page).per(200)

            break unless collections_per_page.present?

            package.workbook.add_worksheet(name: "Page - #{@page}") do |sheet|
              sheet.add_row localized_columns
              collections_per_page.each do |resource|
                sheet.add_row(columns.map { |column| resource.try(column) })
              end
            end

            @page += 1
          end
          package.use_shared_strings = true
        end
      end

      def columns
        resource_class.attribute_names
      end

      def localized_columns
        columns.map do |column|
          resource_class.human_attribute_name(column)
        end
      end

      def filename
        "#{resource_class.to_s.tr('_', '-')}-#{Time.now.strftime('%Y-%m-%d')}.xlsx"
      end
    end
  end
end
