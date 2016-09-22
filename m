From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Sep 2016 13:59:12 -0700
Subject: modules still have .debug_* (was Re: [PATCH 0/3] ARC unwinder switch
 to .eh_frame)
In-Reply-To: <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
 <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <caee47ec-eb68-59ee-50dc-ee02c4d78b7d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On 09/19/2016 06:21 PM, Daniel Mentz wrote:
> I confirmed that the .eh_frame section is present and that the
> .debug_frame section is absent. I also verified that the file size of
> the .ko files are small enough for our embedded platform and that
> unnecessary sections like .debug_info, .debug_line, .debug_str etc.
> are also absent.

BTW it seems with my latest set of patches, modules still have .debug_*.
Can you double check if your tree still has the interim patch which added a linker
script for modules to strip out .debug_*

http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001483.html

I'm not planning to carry it and would prefer addressing the the root cause by
removing the -gdwarf-2 toggle. I've added that and pushed rebased series. Care to
take it for a respin please.

Thx,
-Vineet
