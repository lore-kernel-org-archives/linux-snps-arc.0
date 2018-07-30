From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 30 Jul 2018 17:11:52 +0000
Subject: [PATCH] tst-tzset: raise timeout to 10 seconds
In-Reply-To: <59f880f0-32aa-4a93-7b03-fd46d4e19854@redhat.com>
References: <20180730152844.21999-1-abrodkin@synopsys.com>
 <alpine.DEB.2.20.1807301555590.17805@digraph.polyomino.org.uk>
 <mvmmuu8vh9m.fsf@suse.de> <59f880f0-32aa-4a93-7b03-fd46d4e19854@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1807301710070.17805@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 30 Jul 2018, Florian Weimer wrote:

> > There are a lot of tests that set TIMEOUT to less than 20.
> 
> We should fix all of them.

It's conceivable some are deliberately less than 20 (if e.g. the test 
sleeps for a certain number of seconds and does nothing else that should 
take a significant amount of time), but certainly in the absence of a 
reason for a short timeout I think such settings should be removed.

-- 
Joseph S. Myers
joseph at codesourcery.com
