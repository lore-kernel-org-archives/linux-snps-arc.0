From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 11:43:00 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <20161103181112.GK1859@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
 <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
 <20161102001925.GH1506@mai>
 <2dcf87ce-a278-8ef8-3c8e-3cf7124603c9@synopsys.com>
 <ff516208-8014-f12a-2081-cbfb69dd6a2d@synopsys.com>
 <20161103165032.GA1859@mai>
 <f73c498d-d2f4-2fc8-49ec-9fbf5c5c96b7@synopsys.com>
 <20161103181112.GK1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b4d65d66-7ece-9eed-9d0d-465a6e8f6e19@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 11:11 AM, Daniel Lezcano wrote:
>> Thx for taking a quick look - this is a good start. How about the actual driver
>> > itself, do you want to take a quick look there as well before v2 ?
> At the first glance, with your changes it is acceptable to be moved. Perhaps,
> you can have a look to remove the BIG_ENDIAN stuff in the clock read function.
> 

OK addressed that as well !
