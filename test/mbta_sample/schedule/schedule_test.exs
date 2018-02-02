defmodule MbtaSample.ScheduleTest do
  use MbtaSample.DataCase

  alias MbtaSample.Schedule

  describe "departures" do
    alias MbtaSample.Schedule.Departure

    @valid_attrs %{Destination: "some Destination", Lateness: 42, Origin: "some Origin", ScheduledTime: 42, Status: "some Status", TimeStamp: 42, Track: "some Track", Trip: "some Trip"}
    @update_attrs %{Destination: "some updated Destination", Lateness: 43, Origin: "some updated Origin", ScheduledTime: 43, Status: "some updated Status", TimeStamp: 43, Track: "some updated Track", Trip: "some updated Trip"}
    @invalid_attrs %{Destination: nil, Lateness: nil, Origin: nil, ScheduledTime: nil, Status: nil, TimeStamp: nil, Track: nil, Trip: nil}

    def departure_fixture(attrs \\ %{}) do
      {:ok, departure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_departure()

      departure
    end

    test "list_departures/0 returns all departures" do
      departure = departure_fixture()
      assert Schedule.list_departures() == [departure]
    end

    test "get_departure!/1 returns the departure with given id" do
      departure = departure_fixture()
      assert Schedule.get_departure!(departure.id) == departure
    end

    test "create_departure/1 with valid data creates a departure" do
      assert {:ok, %Departure{} = departure} = Schedule.create_departure(@valid_attrs)
      assert departure.Destination == "some Destination"
      assert departure.Lateness == 42
      assert departure.Origin == "some Origin"
      assert departure.ScheduledTime == 42
      assert departure.Status == "some Status"
      assert departure.TimeStamp == 42
      assert departure.Track == "some Track"
      assert departure.Trip == "some Trip"
    end

    test "create_departure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_departure(@invalid_attrs)
    end

    test "update_departure/2 with valid data updates the departure" do
      departure = departure_fixture()
      assert {:ok, departure} = Schedule.update_departure(departure, @update_attrs)
      assert %Departure{} = departure
      assert departure.Destination == "some updated Destination"
      assert departure.Lateness == 43
      assert departure.Origin == "some updated Origin"
      assert departure.ScheduledTime == 43
      assert departure.Status == "some updated Status"
      assert departure.TimeStamp == 43
      assert departure.Track == "some updated Track"
      assert departure.Trip == "some updated Trip"
    end

    test "update_departure/2 with invalid data returns error changeset" do
      departure = departure_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_departure(departure, @invalid_attrs)
      assert departure == Schedule.get_departure!(departure.id)
    end

    test "delete_departure/1 deletes the departure" do
      departure = departure_fixture()
      assert {:ok, %Departure{}} = Schedule.delete_departure(departure)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_departure!(departure.id) end
    end

    test "change_departure/1 returns a departure changeset" do
      departure = departure_fixture()
      assert %Ecto.Changeset{} = Schedule.change_departure(departure)
    end
  end
end
