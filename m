Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BA8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Apr 2022 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AklH1j4D4U4CKtRPx4nPZxlHUpZ/DOvDzQ0wMLwVip4=; b=bxeWmptZtY0oJY
	R/KwIZXgyUmfZpt7L3m47fyKqtzozHvc4ZevurnsrFqQ3n+a1uyNoiO/K52gyrbC17YqyILKEUlkC
	WW6XgphYW4wVf6tXduY/MyhfAZdezf+i7FtPes/lVoGnf1Nrekzt89qrOZgehlH0Wa+Cs245g7+zO
	wLH8G6fDOUKSErD3LiIpOF5pAudqdeUxU6Pwbn+xPS7MW/QMf1FFJVoXdeEFv+i1zJQVjT/2YQlkI
	FOWBoGgDpWuzazkTCGV8mmMcX1m7qqIRiF1cjnFtKrBpXl091xrWdjhhFzh0dKHKxqFH/Qq3piyEX
	sAWl5S/JRobWdVKzLrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdsK-0001us-IO; Tue, 05 Apr 2022 07:45:16 +0000
Received: from mail.bizcall.pl ([192.71.213.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdsH-0001se-T0
 for linux-snps-arc@lists.infradead.org; Tue, 05 Apr 2022 07:45:15 +0000
Received: by mail.bizcall.pl (Postfix, from userid 1001)
 id 069614164F; Tue,  5 Apr 2022 09:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizcall.pl; s=mail;
 t=1649144678; bh=L7rZPDqncV/PGNK3vBL4eFyhOA8rMHMu3jCfxnl4mEc=;
 h=Date:From:To:Subject:From;
 b=bCZB83bLV9ySDz6Oyzuh/7/CASl8ExAXCSiPmzNy9dRYRNw6GWrnDan+nNbDteqY7
 ROm6TJARg5LVjeqkACyRakMHVU5IGEoJNM3dkWBJfBHD4/541uj/QxcyMUs9NnFG0e
 yenR+EEeQWgXtx1pqLsDd3TqkdJytMBUSIiAuVoLZqNd6vg3bDQmK5gbUQZ9/cZL6V
 efsp7zJ1yCeNQhPiwLN9lE8w7Zqm08XfEwwMRXsP7chhg+eLZOwYmPJ+xV5i6Uw4xP
 QBtB23q0Cgfb+ar9TbDbXeOGBj02Mr3hzdsldr/pG+Dkiz0smhhVTdBOfEwFBpppGO
 OZQq0rWTbb4xg==
Received: by mail.bizcall.pl for <linux-snps-arc@lists.infradead.org>;
 Tue,  5 Apr 2022 07:43:50 GMT
Message-ID: <20220405084501-0.1.1v.5i03.0.bkajgqx6fr@bizcall.pl>
Date: Tue,  5 Apr 2022 07:43:50 GMT
From: "Marek Onufrowicz" <marek.onufrowicz@bizcall.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.bizcall.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_004514_199119_8123AD2A 
X-CRM114-Status: UNSURE (   0.00  )
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
