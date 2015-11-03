From: noamc@ezchip.com (Noam Camus)
Date: Tue, 3 Nov 2015 15:18:15 +0000
Subject: [PATCH v1 02/20] clocksource: Add NPS400 timers driver
In-Reply-To: <56374318.4030109@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-3-git-send-email-noamc@ezchip.com>
 <56374318.4030109@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11410635B6C4CA682663C961D62B0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta [mailto:Vineet.Gupta1@synopsys.com] 
Sent: Monday, November 02, 2015 1:04 PM

>> +
>> +	upper = ioread32be(upper_p);

>Consider using the _relaxed macros even if your platform doesn't have specific IO barriers.
[Noam Camus] What is the big endian flavor for _relaxed macros.
 
>> +	counter = upper;
>> +	counter <<= 32;
>> +	counter |= lower;

>It is easier to read:

>counter = (upper << 32) | lower;

Thanks I will update

- Noam
