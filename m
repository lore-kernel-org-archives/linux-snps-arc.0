Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6993BC433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Feb 2022 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AklH1j4D4U4CKtRPx4nPZxlHUpZ/DOvDzQ0wMLwVip4=; b=gZSK0b/ubQ8+bn
	4e2X1Gex0q0E7rwSROvYBZaRjb7DYGFHrNc33zD+MDn4c4P4eJ4pTyaGCvVILCMau1gvKXr9KBgHN
	4gdAuEKbpt9dgZvs30Ep1TXAg4zDz65w5DbMI+QDCAmHK2EabIRtBCSgKqsoVApKARoWa5xCSL3WV
	lIEfCrWdKTQeVMoxueloQY/GtnnEkX2Z2dr3J5An0tn+6pV3nHyaC0aL9I5wWFXWE8s2RoX8GwSyJ
	YalydUeWPkhnlKbsu6qcXy6+kjH/DeB7Y/K4prcBWTNygTYDKBR4RdOxCu4UPAjhcfaJRdzCvBDaX
	MjS5Y8d6Avz42vU6auEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIRR1-006CjF-9O; Fri, 11 Feb 2022 08:37:43 +0000
Received: from mail.bizcall.pl ([192.71.213.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIRQy-006Cis-7X
 for linux-snps-arc@lists.infradead.org; Fri, 11 Feb 2022 08:37:41 +0000
Received: by mail.bizcall.pl (Postfix, from userid 1001)
 id 97CFF40E75; Fri, 11 Feb 2022 09:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizcall.pl; s=mail;
 t=1644568658; bh=L7rZPDqncV/PGNK3vBL4eFyhOA8rMHMu3jCfxnl4mEc=;
 h=Date:From:To:Subject:From;
 b=Fy4kgm3XG3cUe0/6Xp8JwqrGtE6IX1y1EciNmHcf9epMG8J4jecNJB7zAkjCntxv4
 nbPFtGY4XkgQKOyKERv1q1AOCBj8QPnJKmeR3DEtTuFSh8rVnnhy72CqrBwi4n2roD
 63gXOk++vgPa9Mj5gbw8ory31LG4AUif7ALhb/uDlJTDxk/YJUgpr2QQFu8KqHWHFh
 4JKK0OBevmIG+/CjQzz2HMiam0dsOm+bSFTVQetZiM/0li0nNHjsifFrCE6SUgVDaE
 7f7c48vU1DvXKNhx9XwiQPcTpp+WbMu3MuZGjUzVdGTCGFOgu7aW3xwAWUNaiTpHCe
 ncDCb6tF6yZ9g==
Received: by mail.bizcall.pl for <linux-snps-arc@lists.infradead.org>;
 Fri, 11 Feb 2022 08:34:29 GMT
Message-ID: <20220211084500-0.1.u.2395.0.l0srdzio8o@bizcall.pl>
Date: Fri, 11 Feb 2022 08:34:29 GMT
From: "Marek Onufrowicz" <marek.onufrowicz@bizcall.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.bizcall.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_003740_425497_7678D041 
X-CRM114-Status: UNSURE (   1.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdHdvcnplbmll
IHBsYW51IHRyYXMgY3p5IGRvc3Rhdy4KClogbmFzemVqIHdpZWR6eSBpIGRvxZt3aWFkY3plbmlh
IGtvcnp5c3RhIGp1xbwgcG9uYWQgNDkgdHlzLiBLbGllbnTDs3cuIE1vbml0b3J1amVteSA4MDkg
MDAwIHBvamF6ZMOzdyBuYSBjYcWCeW0gxZt3aWVjaWUsIGNvIGplc3QgbmFzesSFIG5hamxlcHN6
xIUgd2l6eXTDs3drxIUuCgpCYXJkem8gcHJvc3rEmSBvIGUtbWFpbGEgendyb3RuZWdvLCBqZcWb
bGkgbW9nbGliecWbbXkgd3Nww7NsbmllIG9tw7N3acSHIHBvdGVuY2phxYIgd3lrb3J6eXN0YW5p
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtLApN
YXJlayBPbnVmcm93aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
