From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 19 Dec 2018 17:40:11 +0000
Subject: [PATCH 03/21] ARC: ABI Implementation
In-Reply-To: <d54edff9-d0ea-ea53-9a63-550106c35921@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
 <d54edff9-d0ea-ea53-9a63-550106c35921@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812191720290.27531@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> P.S. Is there a lint file or are these style guidelines in wiki 
> somewhere. If not I can volunteer to capture them in a wiki/readme for 
> future port submissions.

In addition to the GNU Coding Standards (which cover many things such as 
comment formatting and spaces before '('), we have 
<https://sourceware.org/glibc/wiki/Style_and_Conventions> which discusses 
various glibc-specific details.  If you find there are points of the style 
in glibc which aren't documented in either place, then, yes, it would be a 
good idea to add them to the wiki (I just added a few).

Architecture maintainers need wiki accounts in any case (to post test 
results for their architectures during every release freeze period), so 
you should create an account and post its name so someone can add it to 
EditorGroup so you can edit.

Where the formatting issues pointed out exist in some existing code in 
glibc, it might also make sense to fix that existing code to follow the 
standards more closely so it provides a better example for new code.  
However, such formatting changes to existing code may be controversial 
(especially for code that originally came from third-party sources using 
completely different formatting - though in my view, where such files are 
now maintained in glibc without ongoing updates from upstream, we ought to 
make the formatting consistent to simplify maintenance).

-- 
Joseph S. Myers
joseph at codesourcery.com
