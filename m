Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAB6D1CDC7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDloqR/3qv4+3j3v4Lm65APvNfhZpDV+lG2G2Xa3cd0=; b=K6wEcHHWUmhX9n
	gqqdRKGTV3+dQMOm/kgoTvudJ7D+WuJZFROtFzO+40bWEBLnk2bqAjjrfwTAe5YFsM9Nmk4TrfY37
	ieHJxElb4OHjrMflj5WBClVwLXOsHSdFNI+q6bQ+h8JTtDkhNs5bNGYXjp0jgtH+fOKH6IjmkNFu9
	kZ8zGbhH0ogDM5GI5wkcrxB9FsXyN5m1n9S4HBSBfQOjBtA74SWdds+vQhv75wLkmvyfewVOKBQg8
	x3pxJ/FJN87ptvFeEOvxqj0j1Jp0DxBM5xysjPTZQ0UFa6bs4bH4z497fnXdeQiRd8XxcR6BhfTUU
	tElXrPA5oKcEJLovYBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B22-0000000AJhd-2HmH;
	Tue, 22 Oct 2024 09:18:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Aya-0000000AIgj-1bB2
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 22 Oct 2024 09:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=s7FimDaFPHHSszW97frhLIBnvTyZgI24IVWW6aFsn+c=; b=aJJxBHjseZX8e6XljVGssHez4E
	TwjJ8X2CCjpn1Y1dvMfUEj+u1xhhn/O9ZW3jwABfQQSbarZ7u/5Uly5MnQf0pd/b9m9WSMr7JT2rc
	572DdW44dcUy45COXBRxDZbg01lWmpV+XdxRU7r0l3A3nLIQHcd235Ub1M9A/Uy7DBK6bi/kwJsJV
	eHaY7Bo4VqqFG9m+Eu7uhBoz+goSs/bSu+tgp6s5r1SCaP0l6rnXjanxakBVBr3kFvxkmVpjBo5nB
	9gNGRLdKxsUh6xPA6pIifDkd+CIS0Qbihzwme8o3725VvOm9MWknJVS/RkJxwn0YgIhJ/XGjyMO5k
	Udt5wfOA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3AyX-00000008AYv-0uH2
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Oct 2024 09:14:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so52525405e9.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 22 Oct 2024 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729588486; x=1730193286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7FimDaFPHHSszW97frhLIBnvTyZgI24IVWW6aFsn+c=;
        b=ujhzaN0z5y2wtT0GT1CxDUzKx4Z6gj13zoL+BL7QQQDAll7A0PLIdqaHyVaCUFzh1G
         OKjQUiXsD8MSkdvGhF6+HXJn1XeuuyIM7rTC/SRL/BqUeH9cBHaOqxhjlamt54u7BATQ
         idJfixhG7TDsC1mrKBN5BBlz1dqCYs4rlKwoBaf9HgSXi78feHJDLLTt5ZQLWq4AaUXg
         F2OGNEsy3zwJ+Qi6jrg3+iRn585mFmaxiHlEhY1uGZAl1nSoy+36hgL5vGxKRertOiPF
         mepUKDtYvvjTrIGcYXNBSWSL0BqJXgWQXW64nw4qWlD8TzZEfpu1aZSs13PXZ299jYE9
         5Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588486; x=1730193286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7FimDaFPHHSszW97frhLIBnvTyZgI24IVWW6aFsn+c=;
        b=a4/j0PMJAFNlR5oZM7wRXo3+bFKsdn84t1wpZqxUZuFEcjMKKIBuKeCUBZpjvt13/9
         FCP8MvPjBOMWtamZxW9UH57elb38A+dFwRBxDbFDg1GymHGCsq/zz6KYBhcCZlJ/klUk
         0LEWAcFHuaBp6RUSM97jSWZhYcoCZQK/ujbFAy9u0D3muECw+6lijhkerzuvQWI4t21I
         j/UsWJCyh+OWuPcusvbLBghriZn0yw8qCElJWgUBB2TtLibZ9CbQ9A36TQsvzIjRaX2r
         ZlCdLLw46rk4iV1J7EwB3SDGLB6tiM7GOxL6sW0e5q8/Cf8nvjaiIRsbErCHGGhfELne
         YorQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUXb5FpGEpZqHlDtCNmzK4O0hIMAPZknt+rBUPTTiKP+bmKDebT2cpFS9sJVY5PTi6kc+pvNAtCh4wgi4G7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkT7Osgna/rgTpURV53jdi9MZukLkjqSEtpaz7vkx3U0xL5Uws
	D/Dxw0ki8xs3meZDrtjOF26Kad2iQZdMAWXV5CkyIsbQ8B1xWOn2eIa9PmDoI9g=
X-Google-Smtp-Source: AGHT+IFJifWnS0Da9PXrgL4CP7rzVjnLt2PtPo5f09svG7okrry5iqiGNHUl8XBSHn6DNxnVUNVcQQ==
X-Received: by 2002:a05:600c:1d99:b0:431:58c4:2eb9 with SMTP id 5b1f17b1804b1-43161633882mr115142075e9.3.1729588486098;
        Tue, 22 Oct 2024 02:14:46 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9442bsm6144760f8f.78.2024.10.22.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:14:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: dts: Replace deprecated snps,nr-gpios property for snps,dw-apb-gpio-port devices
Date: Tue, 22 Oct 2024 11:14:27 +0200
Message-ID: <20241022091428.477697-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=suV6bhYu/87NurHvi0y2NpZFyO8Xn7JmICjdtdKqhTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnF2z0pZ7zddJr3rS9u1fUZTlZuK5KnVxnTOO80 S2Lkyx/XHmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxds9AAKCRCPgPtYfRL+ TsPNB/0b6UvEHYO+kF1z6QvD7dFIO2+qThn/VAGLdKji1dAuhmMqkmffUzJWvrlSMjA6qCTRNQy OiPKB7ZuObsTgZb1TS3VCzYwR9hQhk+o6X92bPZOr4ZhNbOgcVhEoAXqKDk+5FI2ZaRrEZrzWiq snOEady/sE+clgh6M1A1swNYZbHhpiZeo28cJ8TYgcuZwwnU8n5Ez5nTpcX/HM8YIo+Ps0tT6VD fmpnc8jSP86G9U9RkLlrf5YI12vv9j3Ez7d16Cd7pniqWKAC7t2JPgMSPbCxq+FT23K2gbNqYqt 3uLcFsWWZvUL1lMTuGJfXt/WW6D1I5N+dzkeiGSeQQOvJd6b
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_101449_499381_8AEB1D5E 
X-CRM114-Status: GOOD (  11.06  )
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

c25wcyxkdy1hcGItZ3Bpby1wb3J0IGlzIGRlcHJlY2F0ZWQgc2luY2UgY29tbWl0IGVmNDJhOGRh
M2NmMwooImR0LWJpbmRpbmdzOiBncGlvOiBkd2FwYjogQWRkIG5ncGlvcyBwcm9wZXJ0eSBzdXBw
b3J0IikuIFRoZQpyZXNwZWN0aXZlIGRyaXZlciBzdXBwb3J0cyB0aGlzIHNpbmNlIGNvbW1pdCA3
NTY5NDg2ZDc5YWUgKCJncGlvOiBkd2FwYjoKQWRkIG5ncGlvcyBEVC1wcm9wZXJ0eSBzdXBwb3J0
Iikgd2hpY2ggaXMgaW5jbHVkZWQgaW4gTGludXggdjUuMTAtcmMxLgoKVGhpcyBjaGFuZ2Ugd2Fz
IGNyZWF0ZWQgdXNpbmcKCglnaXQgZ3JlcCAtbCBzbnBzLG5yLWdwaW9zIGFyY2gvYXJjL2Jvb3Qv
ZHRzIHwgeGFyZ3MgcGVybCAtcCAtaSAtZSAncy9cYnNucHMsbnItZ3Bpb3NcYi9uZ3Bpb3MvCgou
CgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxp
YnJlLmNvbT4KLS0tCiBhcmNoL2FyYy9ib290L2R0cy9heGMwMDEuZHRzaSAgICAgfCAgMiArLQog
YXJjaC9hcmMvYm9vdC9kdHMvYXhjMDAzLmR0c2kgICAgIHwgIDIgKy0KIGFyY2gvYXJjL2Jvb3Qv
ZHRzL2F4YzAwM19pZHUuZHRzaSB8ICAyICstCiBhcmNoL2FyYy9ib290L2R0cy9heHMxMHhfbWIu
ZHRzaSAgfCAxMiArKysrKystLS0tLS0KIGFyY2gvYXJjL2Jvb3QvZHRzL2hzZGsuZHRzICAgICAg
ICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwMS5kdHNpIGIvYXJjaC9h
cmMvYm9vdC9kdHMvYXhjMDAxLmR0c2kKaW5kZXggMmExNTE2MDdiMDgwLi44OGJjYzdhYjZmNWEg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwMS5kdHNpCisrKyBiL2FyY2gvYXJj
L2Jvb3QvZHRzL2F4YzAwMS5kdHNpCkBAIC01NCw3ICs1NCw3IEBAIGljdGxfaW50YzogZ3Bpby1j
b250cm9sbGVyQDAgewogCQkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsK
IAkJCQlncGlvLWNvbnRyb2xsZXI7CiAJCQkJI2dwaW8tY2VsbHMgPSA8Mj47Ci0JCQkJc25wcyxu
ci1ncGlvcyA9IDwzMD47CisJCQkJbmdwaW9zID0gPDMwPjsKIAkJCQlyZWcgPSA8MD47CiAJCQkJ
aW50ZXJydXB0LWNvbnRyb2xsZXI7CiAJCQkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKZGlmZiAt
LWdpdCBhL2FyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwMy5kdHNpIGIvYXJjaC9hcmMvYm9vdC9kdHMv
YXhjMDAzLmR0c2kKaW5kZXggYzBhODEyNjc0Y2U5Li45YTJkYzM5YTVjZmYgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwMy5kdHNpCisrKyBiL2FyY2gvYXJjL2Jvb3QvZHRzL2F4
YzAwMy5kdHNpCkBAIC02Miw3ICs2Miw3IEBAIGljdGxfaW50YzogZ3Bpby1jb250cm9sbGVyQDAg
ewogCQkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsKIAkJCQlncGlvLWNv
bnRyb2xsZXI7CiAJCQkJI2dwaW8tY2VsbHMgPSA8Mj47Ci0JCQkJc25wcyxuci1ncGlvcyA9IDwz
MD47CisJCQkJbmdwaW9zID0gPDMwPjsKIAkJCQlyZWcgPSA8MD47CiAJCQkJaW50ZXJydXB0LWNv
bnRyb2xsZXI7CiAJCQkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKZGlmZiAtLWdpdCBhL2FyY2gv
YXJjL2Jvb3QvZHRzL2F4YzAwM19pZHUuZHRzaSBiL2FyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwM19p
ZHUuZHRzaQppbmRleCA2NzU1NmY0YjcwNTcuLmYzMTM4MmNiOGJlNCAxMDA2NDQKLS0tIGEvYXJj
aC9hcmMvYm9vdC9kdHMvYXhjMDAzX2lkdS5kdHNpCisrKyBiL2FyY2gvYXJjL2Jvb3QvZHRzL2F4
YzAwM19pZHUuZHRzaQpAQCAtNjksNyArNjksNyBAQCBpY3RsX2ludGM6IGdwaW8tY29udHJvbGxl
ckAwIHsKIAkJCQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLWdwaW8tcG9ydCI7CiAJCQkJZ3Bp
by1jb250cm9sbGVyOwogCQkJCSNncGlvLWNlbGxzID0gPDI+OwotCQkJCXNucHMsbnItZ3Bpb3Mg
PSA8MzA+OworCQkJCW5ncGlvcyA9IDwzMD47CiAJCQkJcmVnID0gPDA+OwogCQkJCWludGVycnVw
dC1jb250cm9sbGVyOwogCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CmRpZmYgLS1naXQgYS9h
cmNoL2FyYy9ib290L2R0cy9heHMxMHhfbWIuZHRzaSBiL2FyY2gvYXJjL2Jvb3QvZHRzL2F4czEw
eF9tYi5kdHNpCmluZGV4IGI2NDQzNTM4NTMwNC4uM2FkZDJmZTI1N2Y4IDEwMDY0NAotLS0gYS9h
cmNoL2FyYy9ib290L2R0cy9heHMxMHhfbWIuZHRzaQorKysgYi9hcmNoL2FyYy9ib290L2R0cy9h
eHMxMHhfbWIuZHRzaQpAQCAtMjUwLDcgKzI1MCw3IEBAIGdwaW8wX2JhbmthOiBncGlvLWNvbnRy
b2xsZXJAMCB7CiAJCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvLXBvcnQiOwogCQkJ
CWdwaW8tY29udHJvbGxlcjsKIAkJCQkjZ3Bpby1jZWxscyA9IDwyPjsKLQkJCQlzbnBzLG5yLWdw
aW9zID0gPDMyPjsKKwkJCQluZ3Bpb3MgPSA8MzI+OwogCQkJCXJlZyA9IDwwPjsKIAkJCX07CiAK
QEAgLTI1OCw3ICsyNTgsNyBAQCBncGlvMF9iYW5rYjogZ3Bpby1jb250cm9sbGVyQDEgewogCQkJ
CWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsKIAkJCQlncGlvLWNvbnRyb2xs
ZXI7CiAJCQkJI2dwaW8tY2VsbHMgPSA8Mj47Ci0JCQkJc25wcyxuci1ncGlvcyA9IDw4PjsKKwkJ
CQluZ3Bpb3MgPSA8OD47CiAJCQkJcmVnID0gPDE+OwogCQkJfTsKIApAQCAtMjY2LDcgKzI2Niw3
IEBAIGdwaW8wX2JhbmtjOiBncGlvLWNvbnRyb2xsZXJAMiB7CiAJCQkJY29tcGF0aWJsZSA9ICJz
bnBzLGR3LWFwYi1ncGlvLXBvcnQiOwogCQkJCWdwaW8tY29udHJvbGxlcjsKIAkJCQkjZ3Bpby1j
ZWxscyA9IDwyPjsKLQkJCQlzbnBzLG5yLWdwaW9zID0gPDg+OworCQkJCW5ncGlvcyA9IDw4PjsK
IAkJCQlyZWcgPSA8Mj47CiAJCQl9OwogCQl9OwpAQCAtMjgxLDcgKzI4MSw3IEBAIGdwaW8xX2Jh
bmthOiBncGlvLWNvbnRyb2xsZXJAMCB7CiAJCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1n
cGlvLXBvcnQiOwogCQkJCWdwaW8tY29udHJvbGxlcjsKIAkJCQkjZ3Bpby1jZWxscyA9IDwyPjsK
LQkJCQlzbnBzLG5yLWdwaW9zID0gPDMwPjsKKwkJCQluZ3Bpb3MgPSA8MzA+OwogCQkJCXJlZyA9
IDwwPjsKIAkJCX07CiAKQEAgLTI4OSw3ICsyODksNyBAQCBncGlvMV9iYW5rYjogZ3Bpby1jb250
cm9sbGVyQDEgewogCQkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsKIAkJ
CQlncGlvLWNvbnRyb2xsZXI7CiAJCQkJI2dwaW8tY2VsbHMgPSA8Mj47Ci0JCQkJc25wcyxuci1n
cGlvcyA9IDwxMD47CisJCQkJbmdwaW9zID0gPDEwPjsKIAkJCQlyZWcgPSA8MT47CiAJCQl9Owog
CkBAIC0yOTcsNyArMjk3LDcgQEAgZ3BpbzFfYmFua2M6IGdwaW8tY29udHJvbGxlckAyIHsKIAkJ
CQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLWdwaW8tcG9ydCI7CiAJCQkJZ3Bpby1jb250cm9s
bGVyOwogCQkJCSNncGlvLWNlbGxzID0gPDI+OwotCQkJCXNucHMsbnItZ3Bpb3MgPSA8OD47CisJ
CQkJbmdwaW9zID0gPDg+OwogCQkJCXJlZyA9IDwyPjsKIAkJCX07CiAJCX07CmRpZmYgLS1naXQg
YS9hcmNoL2FyYy9ib290L2R0cy9oc2RrLmR0cyBiL2FyY2gvYXJjL2Jvb3QvZHRzL2hzZGsuZHRz
CmluZGV4IDQxYjk4MGRmODYyYi4uOThiYjg1MDcyMmE0IDEwMDY0NAotLS0gYS9hcmNoL2FyYy9i
b290L2R0cy9oc2RrLmR0cworKysgYi9hcmNoL2FyYy9ib290L2R0cy9oc2RrLmR0cwpAQCAtMzA4
LDcgKzMwOCw3IEBAIGdwaW9fcG9ydF9hOiBncGlvLWNvbnRyb2xsZXJAMCB7CiAJCQkJY29tcGF0
aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvLXBvcnQiOwogCQkJCWdwaW8tY29udHJvbGxlcjsKIAkJ
CQkjZ3Bpby1jZWxscyA9IDwyPjsKLQkJCQlzbnBzLG5yLWdwaW9zID0gPDI0PjsKKwkJCQluZ3Bp
b3MgPSA8MjQ+OwogCQkJCXJlZyA9IDwwPjsKIAkJCX07CiAJCX07CgpiYXNlLWNvbW1pdDogNzQz
NjMyNGViZDE0NzU5OGY5NDBkZGUxMzM1Yjc5NzlkYmNjYzMzOQotLSAKMi40NS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
