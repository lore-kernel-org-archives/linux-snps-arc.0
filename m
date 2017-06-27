From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 12:03:39 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <e0b3a866-beed-b3c4-e0c8-37d074eed4a5@redhat.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <3bd8b935-47c0-f190-ee6b-3d08e2f3a752@redhat.com>
 <2b02c462-44c4-02bb-6989-b3572834432e@synopsys.com>
 <e0b3a866-beed-b3c4-e0c8-37d074eed4a5@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271202230.17677@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Florian Weimer wrote:

> (Realistically, I'd need a port which can build with
> build-many-glibcs.py for that anyway.)

It's probably not hard to increase the minimum symbol version for an 
existing port, especially one of the newer ones, for testing purposes.  
(It's possible you'd find missing SHLIB_COMPAT conditionals or similar in 
port-specific code when doing so, especially if doing it for an older 
port.)

-- 
Joseph S. Myers
joseph at codesourcery.com
