Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB3D10DCF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Dec 2024 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ssgSC/MuJdgpuSPiHVT9tNaHJWGkmjBXYmgvX4IaIaI=; b=zsxLRDUIkGnj2B
	BrNfKrhq9+mi0P3kAq9ByJB+2a/boUEaijmjrzIKYSPMlws0JqFWpWyqmbecSEsF+8SxUduvwMNVv
	MxG3URsdsO1GZikf700KJOyklF2U9U6J+LhI7X4ut6t3ssuw4wtkbAdtpZjxeYd8RpSQuO7yNLw66
	gcby/5VU9KZwNAPrngQDtfNhkgcNDfGFepRIIC8IiRcn95JTHBZJfHiwf/6eNDbkBXUc20SFYRsL4
	jHSLAjrZ+mYd+wZc3Qs8f+iQASP5CvoNJVCzRn6YTUIGNYhD6zr1pihvcqYYNVuyrk6KkhmoRvOaq
	nIHTZzXMxRep19PQzghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Rv-00000005WBf-1sGD;
	Mon, 02 Dec 2024 09:10:35 +0000
Received: from mail.finteras.pl ([5.249.155.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Rt-00000005WAz-2lyJ
	for linux-snps-arc@lists.infradead.org;
	Mon, 02 Dec 2024 09:10:34 +0000
Received: by mail.finteras.pl (Postfix, from userid 1002)
	id 61FA28326E; Mon,  2 Dec 2024 10:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finteras.pl; s=mail;
	t=1733130632; bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=;
	h=Date:From:To:Subject:From;
	b=DpRfXNPSOXfJ+/b4lQF0pQKdAhY7AHGVUfXpsKRXD1kK7VY+VLV6+eX2pDEqIo8iO
	 UxLopIVOJnM5o5einz9ozjNXdFcgRUHs2+Mlv7/yw5bYFWbPD4OXDVIC+vDG5GRdbQ
	 DeHYw7hfanrSDuYEdNI9hGpxmgehxpRJH6eW5beQQfnHa+Gf0mzS1G+yE2ai/J8qBF
	 lcjRUs8HtY7Bn8YlldHATHNyakdmv5Roq/yLu/RXZLl/jmT8C8QWrWMEw6A7afqINw
	 vrC+34gtuDRG1zAoh2uOqCPCAQ04Z+NqVpukEBH4E//nvXpyyE6s4RVblBOTV6Q5kZ
	 iI7vQhkbv0lDA==
Received: by mail.finteras.pl for <linux-snps-arc@lists.infradead.org>; Mon,  2 Dec 2024 09:10:21 GMT
Message-ID: <20241202084500-0.1.57.6rq4.0.kgrczjn37f@finteras.pl>
Date: Mon,  2 Dec 2024 09:10:21 GMT
From: "Urszula Kurach" <urszula.kurach@finteras.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pakiety_telemedyczne_dla_pracownik=C3=B3w?=
X-Mailer: mail.finteras.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011033_842341_61CD8384 
X-CRM114-Status: UNSURE (   1.26  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYWJ5bSB6YXB5dGHEhywgY3p5IGJ5bGlieSBQYcWE
c3R3byB6YWludGVyZXNvd2FuaSBkb3N0xJlwZW0gZG8gbmllbGltaXRvd2FuZWogb3BpZWtpIHRl
bGVtZWR5Y3puZWogcGVkaWF0cnksIG9ydG9wZWR5LCBuZXVyb2xvZ2Egb3JheiBsZWthcnp5IHdp
ZWx1IGlubnljaCBzcGVjamFsaXphY2ppPwoKT2ZlcnVqZW15IDMgcsOzxbxuZSBwYWtpZXR5LCBr
dMOzcmUgemFwZXduaWFqxIUgZG9zdMSZcCBkbyB1c8WCdWcgZG9wYXNvd2FueWNoIGRvIHBvdHJ6
ZWIgUGHFhHN0d2EgZmlybXkuIFBha2lldCBwb2RzdGF3b3d5IGRhamUgbW/FvGxpd2/Fm8SHIGtv
cnp5c3RhbmlhIHoga29uc3VsdGFjamkgaW50ZXJuaXN0eSBuYXdldCB3IHdlZWtlbmR5IGkgxZt3
acSZdGEsIG5hdG9taWFzdCBwYWtpZXQgcGXFgm55IG9iZWptdWplIGRvc3TEmXAgZG8gbGVrYXJ6
eSA0MiBzcGVjamFsaXphY2ppLCBhIHRha8W8ZSBhdHJha2N5am5lIHJhYmF0eSBuYSBiYWRhbmlh
IGxhYm9yYXRvcnlqbmUgaSBkaWFnbm9zdHlrxJkgb2JyYXpvd8SFLgoKRHppxJlraSB0YWtpbSBy
b3p3acSFemFuaW9tLCBQYcWEc3R3YSBwcmFjb3duaWN5IHp5c2thasSFIHdhcnRvxZtjaW93eSBi
ZW5lZml0IHBvemFwxYJhY293eSwgYSBmaXJtYSB6eXNrYSB6bW90eXdvd2FueSB6ZXNww7PFgiwg
bW5pZWogYWJzZW5jamkgY2hvcm9ib3d5Y2ggaSBkb2RhdGtvd2Ugb3N6Y3rEmWRub8WbY2kuCgpD
enkgbW9nxJkgcHJ6ZWRzdGF3acSHIHdpxJljZWogc3pjemVnw7PFgsOzdyBuYSB0ZW1hdCBkb3N0
xJlwbnljaCBwYWtpZXTDs3c/CgoKUG96ZHJhd2lhbQpVcnN6dWxhIEt1cmFjaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
