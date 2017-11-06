From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 6 Nov 2017 12:19:08 -0800
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <71bc62c1-11bd-d1a7-c78c-5cc2d166f682@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Joseph,

On 06/27/2017 04:56 AM, Joseph Myers wrote:
> On Tue, 27 Jun 2017, Vineet Gupta wrote:
> 
>> Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> 
> We need ChangeLog entries and copyright assignments, but don't use
> Signed-off-by.

Revisiting glibc upstreaming for ARC. I was told that the lawyers did their "foo". 
Do you have the copyright assignment from Synopsys already - or do you want me to 
send it to you (privately perhaps)

glibc has obviously moved on since our initial submission. What branch / tag shall 
I rebase off of. This also has a bearing on minimum symbol version, which per the 
last comment on the list was changed to 2.26 across the port !

Thx,
-Vineet
