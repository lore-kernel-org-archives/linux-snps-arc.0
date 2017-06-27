From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 19:56:15 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <b9446e5b-5263-3711-8232-c0d4dc5d4852@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <b9446e5b-5263-3711-8232-c0d4dc5d4852@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271953380.21267@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Vineet Gupta wrote:

> On 06/27/2017 02:56 PM, Joseph Myers wrote:
> > > Signed-off-by: Cupertino Miranda<cmiranda at synopsys.com>
> > > Signed-off-by: Vineet Gupta<vgupta at synopsys.com>
> > We need ChangeLog entries and copyright assignments, but don't use
> > Signed-off-by.
> 
> About the copyright assignment and $start-$end, I suppose end needs to be
> 2017, what about start - does it need to be specific year.

The start year should be the earliest year in which a published file from 
which you took copyrightable content was completed.  If copyrightable 
content was copied from another port in glibc, that means you copy the 
start year from the file you copied from.  If this port or parts thereof 
has been developed in a public version control system, then files that are 
completely new to this port should use the year of the first revision of 
those files in that public version control system.

-- 
Joseph S. Myers
joseph at codesourcery.com
