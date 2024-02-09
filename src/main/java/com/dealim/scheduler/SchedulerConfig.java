package com.dealim.scheduler;

import com.dealim.domain.Notification;
import com.dealim.domain.Ticket;
import com.dealim.repository.NotificationRepository;
import com.dealim.repository.TicketRepository;
import com.dealim.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDateTime;
import java.util.List;

@Configuration
@EnableScheduling
public class SchedulerConfig {

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private NotificationService notificationService;
    @Autowired
    private NotificationRepository notificationRepository;

    @Scheduled(fixedRate = 60000) //  매 1분마다 실행 한다는거
    public void sendReminderNotifications() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime oneHourLater = now.plusHours(1);

        List<Ticket> tickets = ticketRepository.findByTicketedDateBetween(now, oneHourLater);
        for (Ticket ticket : tickets) {
            // 중복 알림 생성 방지
            long existingNotificationsCount = notificationRepository.countByMovieIdAndTypeAndCreatedDateTimeBetween(ticket.getMovieId(), Notification.NotificationType.MOVIE_BOOKED, LocalDateTime.now().minusDays(1), LocalDateTime.now());
            if (existingNotificationsCount == 0) {
                notificationService.sendMovieStartNotification(ticket.getMemberId(), ticket);
            }
        }
    }
}