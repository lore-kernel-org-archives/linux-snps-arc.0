Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E65C83F09
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jul 2025 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=joDZ/S3QZgO2w7i33WqaH8nZDUNMIsG24+kmdaP6lKw=; b=RTfQPjfbrGck87
	SmLugjWzSJsY8piNreVnYRmDJwt6gmG8c5YjyRiephPJx4ecXKQ569YD6EaqOvgW2hl18aY1ambrl
	SwSpu/CvkvgqkzS8cdPXiHf0nzqrCIrnzVWzgU+aPmapg7QjwPZJv0sogAF9tI//CxHl9RK/ZW+sh
	8AiGvnuWv/2jgsh1tY9wKNfxSndl1C+SLZUlh/vDrOcALivBNNDRiIxNCB22QmR6ehGHf0zP2Asrx
	6V4SJdQWlurGhYVvOpvrVqeM1Usu29UZw2LxlGKr4AswZBhklS6DbMbzZgca329oMNBWdxlBYD7I9
	8/dIydQovp2aNkUoJThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQt9-000000085uU-1Rl3;
	Wed, 09 Jul 2025 09:14:51 +0000
Received: from mail.bizovo.pl ([217.61.16.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPJd-00000007pBv-2Hn4
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Jul 2025 07:34:06 +0000
Received: by mail.bizovo.pl (Postfix, from userid 1002)
	id E24DD8361B; Wed,  9 Jul 2025 09:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizovo.pl; s=mail;
	t=1752046372; bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=;
	h=Date:From:To:Subject:From;
	b=WzCvx+GYryKvDm3r519ROhsarSUuuy6FL4I58bKvNogjp1ul62mRrmy/9zR3gi1wt
	 WIx+1FuaC8u7vWMubWOLYqRq7xRTwSXAbukMy+3hnUmCK3AiMYBDMbaRKr00yQ+6Zi
	 mj2hnn6ynj5b+EO2T3VnQ3ubF3RIpqJIkQYQZZMKVfaMXAqKJ5ikNMMEARF+Hm5cV9
	 CNPbOom4e09g6n+73yrOqgL4blyDLnySN9+lWwo52OdU6H3yqD78W8MUvdjYko1NZC
	 7nclJ7eqBrlHf+TITeh9CJWvFVTYWXQaBowIrUOqT/dLxrmi0TyP+WFUlT/w3bzEyz
	 kIVj7dpzapFbw==
Received: by mail.bizovo.pl for <linux-snps-arc@lists.infradead.org>; Wed,  9 Jul 2025 07:31:04 GMT
Message-ID: <20250709084500-0.1.8v.19dga.0.7qu4bfj5fl@bizovo.pl>
Date: Wed,  9 Jul 2025 07:31:04 GMT
From: "Wiktoria Bielaszka" <wiktoria.bielaszka@bizovo.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.bizovo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003405_712109_08C71EE7 
X-CRM114-Status: UNSURE (   0.36  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSBwbGFudWrEhSBQYcWEc3R3byBvcHR5bWFsaXphY2rEmSBrb3N6
dMOzdyBlbmVyZ2lpIGVsZWt0cnljem5laiB3IHN3b2plaiBmaXJtaWU/CgpDaGNpZWxpYnnFm215
IHByemVkc3Rhd2nEhyBuYXN6xIUgb2ZlcnTEmSBYUE9ULCBrdMOzcmEgbW/FvGUgcHJ6eW5pZcWb
xIcgem5hY3rEhWNlIG9zemN6xJlkbm/Fm2NpLiBKdcW8IG9kIHRlcmF6LCBtb2fEhSBQYcWEc3R3
byB1enlza2HEhyBjZW7EmSBuacW8c3rEhSBvIDQwLDklIHcgc3Rvc3Vua3UgZG8gb2JlY25laiBj
ZW55IHVzdGF3b3dlai4gCgpOYXN6YSBwcm9wb3p5Y2phIG9iZWptdWplIGxhdGEgMjAyNSBpIDIw
MjYsIGEgc3RhcnQgd3Nww7PFgnByYWN5IGplc3QgbW/FvGxpd3kgb2QgemFyYXouIEd3YXJhbnR1
amVteSBlbGFzdHljem5lIHdhcnVua2kgdW1vd3kgKDMtNi05LTEyIG1pZXNpxJljeSksIHphcGV3
bmlhasSFYyBtaW5pbXVtIGZvcm1hbG5vxZtjaS4KCkplc3RlxZtteSBwaW9uaWVyZW0gdyBzcHJ6
ZWRhxbx5IGVuZXJnaWkgdyBjZW5hY2ggUkROIHdlZMWCdWcgVEdFIGRsYSBrYcW8ZGVqIGdydXB5
IHRhcnlmb3dlai4gUHJ6ZXogY2HFgnkgb2tyZXMgdHJ3YW5pYSB1bW93eSB6YXBld25pYW15IFBh
xYRzdHd1IGRlZHlrb3dhbmVnbyBvcGlla3VuYSwgYSBjYcWCeSBwcm9jZXMgWm1pYW55IFNwcnpl
ZGF3Y3kgaSB3c3plbGtpZSBmb3JtYWxub8WbY2kgcmVhbGl6dWplbXkgemEgS2xpZW50w7N3LiAg
CgpDaMSZdG5pZSBwb3Jvem1hd2lhbSBvIHR5bSwgamFrIG1vxbxlbXkgd3Nww7NsbmllIHpyZWFs
aXpvd2HEhyBQYcWEc3R3YSBjZWxlIGVuZXJnZXR5Y3puZS4gUHJvc3rEmSBvIHdpYWRvbW/Fm8SH
IHcgcHJ6eXBhZGt1IHphaW50ZXJlc293YW5pYS4gCgoKWiBwb3pkcm93aWVuaWFtaQpXaWt0b3Jp
YSBCaWVsYXN6a2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
