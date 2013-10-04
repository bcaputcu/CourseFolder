module ApplicationHelper

	def link_to_add_section(name, f, association)
		new_object = f.object.send(association).klass.new
		new_object.time_slots.new
		link_to_add_fields(name, f, association, new_object)
	end

	def link_to_add_fields(name, f, association, new_object=nil)
		new_object ||= f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to("<i class='icon-plus'></i> #{name}".html_safe, '#', class: "add_fields btn controls", data: {id: id, fields: fields.gsub("\n", ""), association: association.to_s.singularize})
	end
end
