Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F80FC10F16
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=02Pb5WbaEoIYPYZ6dyg9tJbv/7yF+jIdcae1Wzb6THc=; b=p5KD0tUnJEJqQN
	z3zVIb5xpwvNvaBJ8ijAJlNfj2bo5La3/ZxqvuQn00WR7tPCguQvjazdupSIvJ3l3HNDDQ8AbS+38
	T+K81CkO90QANUSx5urTsmsHotHkQFm5vc5nTMRaJPj1sdutennXY4BmkbRGGBxi9HsFKo2sLcVDz
	qY1bkXmq96mnWqTLIKwLQ0+cqJTdmwh0Rm5XWfy4oU3K7B6lpxjz42zqBI3mF01xlrk3iM1b+QOQl
	wuY1KH/ki/PNFcc/4S5PVJrlPt6gBy9hPibae/ZL16CeVLCdC9fe2GQWxpFFzETX7Lq5GPddbIHg2
	a9r2Xo5Xqm2Olma9FcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7S-00000006zwO-1nP2;
	Tue, 30 Apr 2024 15:10:10 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7N-00000006zrw-0SJa
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GiRTAbrp/7+4Jg5orh/7rFIb6CcKTXebv97OiZs/p3s=;
	b=p3UO8u3gYLXhyYHTcw9QvS/hnE33lYnVJFJ6Yuue0VF2BbNowFCG99BLWizzJ2oOYXayMz
	EkyzLlWN+KMz5qtA45Vad6O9oa4FAPVY1FOeDVm0TCHKOUNAzhq/AimRdlRFLk0MAX8wZ/
	v6Sw03cPQaA/9CyFRiy6z1Ro6UQfmpuX4QVtTug7t2pYd0gzbpY6t1LE8POHtCTp1zfVy8
	Jk6FEwGb7XXKsYxkecHx4b61of7zbUx1z8plfaLUDk1M9/ij2EtW7GxXMJu/95l+Af93w6
	Ij9WsNPWSEVCdagW/Ho7tpmrpgM+PZwzxujsoP860HN3jqfCw7itrTlGn7eF4w==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [off-list] [PATCH 0/7 bpf-next v2] ARC: Add eBPF JIT support
Date: Tue, 30 Apr 2024 17:09:30 +0200
Message-Id: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081006_368777_8D64161E 
X-CRM114-Status: UNSURE (   8.59  )
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

RnJvbTogU2hhaGFiIFZhaGVkaSA8c2hhaGFiQHN5bm9wc3lzLmNvbT4KCltvZmYtbGlzdF0KCkhp
IEJqw7ZybiwKCkZpcnN0IGFuZCBmb3JlbW9zdCwgSSBhcG9sb2dpc2UgdGhhdCBpdCB0b29rIG1l
IGEgbG9uZyB0aW1lCnRvIHJld29yayB3aGF0IHdlIGhhdmUgZGlzY3Vzc2VkIGFib3V0IHRoZSBm
aXJzdCB2ZXJzaW9uCm9mICJBUkM6IEFkZCBlQlBGIEpJVCBzdXBwb3J0IiBwYXRjaC4KCkluIG9y
ZGVyIHRvIG1ha2UgdGhlIHNlY29uZCByZXZpZXcgZWFzaWVyIGZvciB5b3UsIHNpbmNlIHlvdQph
bHJlYWR5IGhhdmUgcmV2aWV3ZWQgUEFUQ0ggdjEgWzFdLCBJIHNoYXJlIHdpdGggeW91IHRoZQph
ZGRpdGlvbmFsIGNoYW5nZXMgaW4gc2VyaWVzIGZvcm1hdCwgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsCnNhdmUgeW91IHNvbWUgdGltZSBhbmQgcmVmcmVzaCB5b3VyIG1lbW9yeSBiZXR0ZXIgb24g
dGhlIHRoaW5ncwpkaXNjdXNzZWQgWzNdLgoKSSBoYXZlIHRvIGl0ZXJhdGUgdGhhdCB0aGVzZSBj
aGFuZ2VzIGFyZSBpZGVudGljYWwgdG8gdGhlCnN1Ym1pdHRlZCB2MiBwYXRjaCBbMl06Cgp2MSAr
IHRoaXMgc2VyaWVzID0gdjIKCklmIHlvdSBoYXZlIGFueSBmZWVkYmFjaywgcGxlYXNlIGtpbmRs
eSByZXBseSB0byB2MiBwYXRjaAppbiB0aGUgbWFpbGluZyBsaXN0IFsyXS4KClRoYW5rIHlvdSBh
bmQgaGF2ZSBhIGdyZWF0IHRpbWUsClNoYWhhYgoKWzFdIFtQQVRDSCBicGYtbmV4dCB2MV0gQVJD
OiBBZGQgZUJQRiBKSVQgc3VwcG9ydApodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAy
MTMxMzE5NDYuMzIwNjgtMS1saXN0K2JwZkB2YWhlZGkub3JnLwoKWzJdIFtQQVRDSCBicGYtbmV4
dCB2Ml0gQVJDOiBBZGQgZUJQRiBKSVQgc3VwcG9ydApodHRwczovL2xvcmUua2VybmVsLm9yZy9i
cGYvMjAyNDA0MzAxNDU2MDQuMzg1OTItMS1saXN0K2JwZkB2YWhlZGkub3JnLwoKWzNdIERpc2N1
c3Npb24gb24gd2hhdCBzaG91bGQgYmUgaW1wcm92ZWQKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnBmLzZlNGNmN2NjLTZhMmUtNDM5Ni1iMGQ1LTAxZmYxMGQ2OTIzYUB2YWhlZGkub3JnLwoKClNo
YWhhYiBWYWhlZGkgKDcpOgogIHYyOiBUdXJuICJlbWl0IiBmcm9tIGdsb2JhbCBpbnRvIGEgY29u
dGV4dCB2YXIKICB2MjogVHVybiAiemV4dF90aHlzZWxmIiBmcm9tIGdsb2JhbCBpbnRvIGEgY29u
dGV4dCB2YXIKICB2MjogVXNlIG1lbXNldCgpIGluIGppdF9jdHhfaW5pdCgpCiAgdjI6IE1BSU5U
QUlORVJTOiBBZGQgIkJQRiBKSVQgZm9yIEFSQyIgZW50cnkKICB2MjogRml4IHR5cG9zCiAgdjI6
IEZpeCBtb3N0IG9mIHRoZSAiQ2hlY2tzIiBmcm9tICJjaGVja3BhdGNoLnBsIgogIHYyOiBDaGVj
ayAiYnBmX2ppdF9iaW5hcnlfbG9ja19ybygpIiByZXR1cm4gdmFsdWUKCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgIHwgICA2ICsKIGFyY2gvYXJjL25ldC9icGZfaml0LmggICAgICAgfCAx
NDcgKysrKystLS0tLQogYXJjaC9hcmMvbmV0L2JwZl9qaXRfYXJjdjIuYyB8IDUyOCArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcmMvbmV0L2JwZl9qaXRfY29yZS5j
ICB8IDIxNCArKysrKysrLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0NTQgaW5zZXJ0aW9ucygr
KSwgNDQxIGRlbGV0aW9ucygtKQoKLS0gCjIuMzUuOAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
