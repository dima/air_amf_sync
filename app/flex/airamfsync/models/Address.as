package airamfsync.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="addresses")]
  [Bindable]
  public class Address extends RxModel {
    public static const LABEL:String = "lineOne";

    public var lineOne:String = "";

    public var lineTwo:String = "";

    public var city:String = "";

    public var zip:String = "";

    public var state:String = "";

    public var country:String = "";

    [Lazy]
    [BelongsTo(polymorphic="true", dependsOn="Business")]
    public var owner:Object;

    public function Address() {
      super(LABEL);
    }
  }
}
