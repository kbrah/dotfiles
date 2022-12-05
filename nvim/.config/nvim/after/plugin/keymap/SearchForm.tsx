type SearchFormProps = {
  CoordinateSelect: any;
  Input: any;
  WarehouseSelect: any;
  control: any;
  field: any;
  handleSubmit: any;
  onSubmit: any;
  watch: any;
};

export const SearchForm: React.FC<SearchFormProps> = ({
  CoordinateSelect,
  Input,
  WarehouseSelect,
  control,
  field,
  handleSubmit,
  onSubmit,
  watch,
}) => {
  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Space>
        <Controller
          control={control}
          name="specimenNumber"
          render={({ field }) => <Input {...field} placeholder="Näytenumero" />}
        />
        <Controller
          control={control}
          name="warehouse"
          render={({ field }) => <WarehouseSelect {...field} />}
        />
        <Controller
          control={control}
          name="coordinate"
          render={({ field }) => (
            <CoordinateSelect {...field} warehouseId={watch("warehouse")} />
          )}
        />
        <Button htmlType="submit">Hae</Button>
      </Space>
    </form>
  );
};
