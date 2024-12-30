import '../models/calendar_event.dart';
import '../models/station.dart';
import '../resources/app_colors.dart';

const int minWidthForExpandedDrawer = 1200;
const int minWidthForExpandedAssets = 550;
const int minWidthForExpandedSellCars = 650;
const int minWidthForExpandedCalendar = 750;
const int minWidthForExpandedService = 750;
const int minWidthForExpandedServiceStationInfo = 480;
const int minWidthForExpandedMessages = 650;
// const int minWidthForExpandedMessages = 450;

List<CalendarEvent> events0 = [
  CalendarEvent(
    id: 1,
    startTime: DateTime(2024, 11, 15, 0, 0),
    endTime: DateTime(2024, 11, 15, 2, 0),
    color: AppColors.primary.purple,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '01',
    participants: [],
  ),
  CalendarEvent(
    id: 2,
    startTime: DateTime(2024, 11, 15, 0, 45),
    endTime: DateTime(2024, 11, 15, 1, 45),
    color: AppColors.secondary.blue,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '02',
    participants: [],
  ),
  CalendarEvent(
    id: 3,
    startTime: DateTime(2024, 11, 15, 1, 30),
    endTime: DateTime(2024, 11, 15, 4, 20),
    color: AppColors.secondary.green,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '03',
    participants: [],
  ),
  CalendarEvent(
    id: 4,
    startTime: DateTime(2024, 11, 15, 3, 20),
    endTime: DateTime(2024, 11, 15, 4, 20),
    color: AppColors.secondary.orange,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '04',
    participants: [],
  ),
];
List<CalendarEvent> events = [
  CalendarEvent(
    id: 1,
    startTime: DateTime(2024, 11, 15, 0, 0),
    endTime: DateTime(2024, 11, 15, 2, 0),
    color: AppColors.primary.purple,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '01',
    participants: [],
  ),
  CalendarEvent(
    id: 2,
    startTime: DateTime(2024, 11, 15, 2, 10),
    endTime: DateTime(2024, 11, 15, 5, 0),
    color: AppColors.secondary.blue,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '02',
    participants: [],
  ),
  CalendarEvent(
    id: 3,
    startTime: DateTime(2024, 11, 15, 3, 30),
    endTime: DateTime(2024, 11, 15, 5, 15),
    color: AppColors.secondary.green,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '03',
    participants: [],
  ),
  CalendarEvent(
    id: 4,
    // startTime: DateTime(2024, 11, 15, 4, 0),
    startTime: DateTime(2024, 11, 15, 5, 0),
    endTime: DateTime(2024, 11, 15, 6, 0),
    color: AppColors.secondary.orange,
    onColor: AppColors.gray.white,
    title: 'Private Event',
    type: 'All Motorbikes',
    info: '04',
    participants: [],
  ),
  CalendarEvent(
    id: 5,
    startTime: DateTime(2024, 11, 15, 7, 10),
    endTime: DateTime(2024, 11, 15, 11, 0),
    color: AppColors.secondary.blue,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '05',
    participants: [],
  ),
  CalendarEvent(
    id: 6,
    startTime: DateTime(2024, 11, 15, 7, 30),
    endTime: DateTime(2024, 11, 15, 9, 0),
    color: AppColors.secondary.green,
    onColor: AppColors.gray.white,
    title: 'Drift Series Firs Round',
    type: 'JDM',
    info: '06',
    participants: [],
  ),
  CalendarEvent(
    id: 7,
    startTime: DateTime(2024, 11, 15, 9, 30),
    endTime: DateTime(2024, 11, 15, 10, 30),
    color: AppColors.secondary.orange,
    onColor: AppColors.gray.white,
    title: 'Private Event',
    type: 'All Motorbikes',
    info: '07',
    participants: [],
  ),
  CalendarEvent(
    id: 8,
    startTime: DateTime(2024, 11, 15, 16, 0),
    endTime: DateTime(2024, 11, 15, 18, 0),
    // color: AppColors.secondary.orange,
    onColor: AppColors.gray.white,
    title: 'Private Event',
    type: 'All Motorbikes',
    info: '08',
    participants: [],
  ),
];

List<Station> listStations = [
  const Station(
    name: 'A1',
    isBooked: false,
  ),
  const Station(
    name: 'A2',
    isBooked: false,
  ),
  const Station(
    name: 'A3',
    isBooked: false,
  ),
  const Station(
    name: 'A4',
    isBooked: true,
  ),
  const Station(
    name: 'A5',
    isBooked: false,
  ),
  const Station(
    name: 'A6',
    isBooked: false,
  ),
  const Station(
    name: 'A7',
    isBooked: false,
  ),
  const Station(
    name: 'A8',
    isBooked: false,
  ),
  const Station(
    name: 'A9',
    isBooked: false,
  ),
  const Station(
    name: 'A10',
    isBooked: true,
  ),
  const Station(
    name: 'B1',
    isBooked: true,
  ),
  const Station(
    name: 'B2',
    isBooked: false,
  ),
  const Station(
    name: 'B3',
    isBooked: false,
  ),
  const Station(
    name: 'B4',
    isBooked: false,
  ),
  const Station(
    name: 'B5',
    isBooked: false,
  ),
  const Station(
    name: 'B6',
    isBooked: false,
  ),
  const Station(
    name: 'B7',
    isBooked: true,
  ),
  const Station(
    name: 'B8',
    isBooked: false,
  ),
  const Station(
    name: 'B9',
    isBooked: false,
  ),
  const Station(
    name: 'B10',
    isBooked: false,
  ),
];
