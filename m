Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE002C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Feb 2022 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VxEWFnH50Jl3wlAi3O3pi/QpPguw1hYus2ypxwKXvQY=; b=cQcWOUZfcF8Xb5
	n+BhZtzJAC3Q8a3AJ5ZXClIq1ELiDB4nsKQZqu12rMLrz8IfxKrN8I/i4fYFfDXHp1ggQkwZhhPlS
	jl3CWhPgZbN6nXhAv+EflhSGROtMSWisOweV73oPc6nNsdQYPmv+G0fdheIaX6k0u9PzkuZFexbv5
	CL6JykPw4hD6Gj6TCWTl1s4RPjqmue8/5TQA+90D5c8g9tT0WwsqEHLHi14nXC14YEQmeCz921URL
	D8P+MACjl6ifky5fofiUgVSg5KkoVAFwcIJjiZu8fQ6fw/f+IVRNWkWDA0vA2Fo7T9dkP5MomG4Oc
	NWzwYRESjpF4MDrk6QTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFCDV-00EoFM-S2; Wed, 02 Feb 2022 09:46:21 +0000
Received: from mail.trueanalyze24.com ([149.154.157.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFCDS-00EoEV-Mm
 for linux-snps-arc@lists.infradead.org; Wed, 02 Feb 2022 09:46:20 +0000
Received: by mail.trueanalyze24.com (Postfix, from userid 1001)
 id 0DEE4436B4; Wed,  2 Feb 2022 10:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trueanalyze24.com;
 s=mail; t=1643795040;
 bh=EGenFkmmv/iHCwB4AbTzX8IXCMu1xRW+9eep7HJGZMM=;
 h=Date:From:To:Subject:From;
 b=vJ0hYTzVNeQnL8P2klXxS0qZoRkIrSifDw88CMBvMcjwFUaENnSmItZzOgPMY5n4k
 WboNUFU5e/MDYOz45hCWEn9DjhxsypwD2QxSBu42hj6s3kOjHjQuuX02hjzKzI3JJm
 EcFJsdoC0ufYSjGiXIOjsp1wJgs8eJkvMWzmtNesZSqD9F+mQ6ZTW5wKflvkGAYwfw
 0SsDTqfl/g8ZOFgagzwEQRxcqmJGytsX3sKbMpRJ1x4LuEHjPe03pD9oDdeBfzwI88
 B7yS9uG4RzxyS0TGiK/EYCDbVJyqoEoBY4nZVKv4QhlVNzB4/+kwqyOTFJe8O3i8TR
 V67KLqO2UGuRA==
Received: by mail.trueanalyze24.com for <linux-snps-arc@lists.infradead.org>;
 Wed,  2 Feb 2022 09:32:10 GMT
Message-ID: <20220202084511-0.1.1h.h60o.0.lja04r70jj@trueanalyze24.com>
Date: Wed,  2 Feb 2022 09:32:10 GMT
From: "Mateusz Talaga" <mateusz.talaga@trueanalyze24.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.trueanalyze24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_014618_899861_F9869E8B 
X-CRM114-Status: UNSURE (   2.13  )
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
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpaIHBvd2HFvGFuaWVt
LApNYXRldXN6IFRhbGFnYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
