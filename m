Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ED5C43217
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eb8feGJWe/yCy6H+4FY3FKKw3cp74syo508YlFCYBrw=; b=kBPVzP9MWUXoTI
	CYBWN1ezAa0/rPpa4f1g2Ix4H5Gq28NjEzCx73/qg1Q/7UHlhk5W+x7oy4sCNidKlE3e1OcTlWG17
	z7L5mJzqVCjpY0qurArSKqtOIFpb8MNzB6OKyr/OBi/f5UpRqQQVuslAdpOB7/xMSNVPTk0NCMcxV
	24ab/dvWvlCCMTBa+HNsO9i9RpKVvby8SlS+5nW1hoTYrqi+9HCLj/60TX37E/yOanY6r2GCLrh9a
	x2cHuFcFTAHnRrwIl0aAW1rNuqd3NFYfhkRadwC3c57+mJNRYrWgt1N4PE2QqSDwgmmsh7bXkrjsb
	rLkvPXmsX+VlHuWKLyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVnK-009nhj-U1; Tue, 22 Feb 2022 14:05:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVnG-009nex-JQ
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:05:33 +0000
Received: by mail-lj1-x235.google.com with SMTP id e17so19706364ljk.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+p3LzvqXrg9EMk2WkuYtrqOyeLFb0wUB8tMCCXlX10=;
 b=iIVJ36z1eroq0jJbD70VT3BRuBOD0iKcU0nNSTpFId9yOpm811vdYbU0NtcOcFsmNN
 ZF/9DW14uKYrKBm0Czx/54l6ATtqI1EnXqPGK5F5dpKID0+3lcot7S8pjq5xT3eF+/8W
 mDPwZ6XeGWx4Fo1HGVe5xousDzPbEoAkohotcDm0DBRpLaaDy7kvCujyuKnEw5xwzt/v
 fDnHBJlDSacp+TFUmeDOhC2KqqI7937KUy4L7zx1aPJ6lTamgK9rE2k/5lUJh8qymkeN
 0jyagOfbOnHI3+SJEtmuZKY/D1IW2mGrQ/B3+u04VdM60uL+7+HEgMVPP68QVE5o2Ogk
 PrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+p3LzvqXrg9EMk2WkuYtrqOyeLFb0wUB8tMCCXlX10=;
 b=V82Q8+Makd+e/C3gGVGO8veK7Drm3Bk+ChGiQC8ThzKm8ghR8VuCW3mcQ2dmWRiImi
 8xFN1tgjJmIWWrdm9hpKVeUKSVEBsDU8+f7VaHfdtnfTfsJwIGE3Cjgs7XZq7Wog9+re
 Ltgn1U16pXUZsODWnCFpQAv3esBGX1HadXwUB06dZbxRzsdcgnPBG5xuxNF7jAmHVaQh
 3+snoQ1SwMdqXAycOGvC6a+Jo+gM3mCGi0sB428WsK0/h8aiDAUoVuox4b391Lol7DxC
 N+dXPC1aNXUD0GSZpdd1owIO0Dp0k8FpHwoxUJE7/9C89ye6EMmUiPzpMeFYCNpA7SX0
 Yy9Q==
X-Gm-Message-State: AOAM532IuEZMp18hKGrMdlKprOL6F4dOsqalQ/62RytyGqKwgzc7fH7U
 0g58VhjbOqivhQ3MwGuyyujyDK2I1Vk=
X-Google-Smtp-Source: ABdhPJytFOzmk9ilg8Mn3D3o6DB7FE8oV+x9WP7P3A5wdnKXqSB1gFx8RkdrKm3hcxXfos/yPW2nKQ==
X-Received: by 2002:a05:651c:2cb:b0:23e:9985:518 with SMTP id
 f11-20020a05651c02cb00b0023e99850518mr17207435ljo.18.1645538728505; 
 Tue, 22 Feb 2022 06:05:28 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id a19sm512003ljq.80.2022.02.22.06.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:05:28 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 0/2] ARC: atomic: cleanup and optimization fixes
Date: Tue, 22 Feb 2022 17:05:23 +0300
Message-Id: <20220222140525.4002518-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_060530_670938_54B3482B 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Hi Vineet and all,

This patch set provides cleanup for atomic-llsc code and fixes for
unwanted compiler optimizations in ARCv2 32bit and 64bit atomics.

Regards,
Sergey

Sergey Matyukevich (2):
  ARC: atomic: cleanup atomic-llsc definitions
  ARC: atomic: avoid unwanted gcc optimizations in atomic operations

 arch/arc/include/asm/atomic-llsc.h    | 68 +++++++++++++--------------
 arch/arc/include/asm/atomic64-arcv2.h | 58 +++++++++++------------
 2 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
