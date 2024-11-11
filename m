Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E5D2E9F0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2024 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOJ+ffzLxBz0ILB05SWvLi9MxVd3yPWTQnTn+KhYLm4=; b=qFBKC07niOK7tL
	gi85v/4VoPqWxXUqdpiRsHKzIGuz/z4osw8qoZwY69k1LqO+lGBksHsyfCDodpYsb24bhH63I/9Fr
	3i+wBxG/dJXQO5cZfZFGfagQyDa7L3j+OuC4HbZdNAxHA6h3WHAmN5MeN1qxjNKg/eGskuyHYpUHz
	5GtFepVPv6EKJuQw9+XP4My0yQqOGFXofMt3eKNAB269bJwRK3fDl+V5CjlbHDeVMK5gl0x9LhySE
	b7RXZ5rnDmeVHDsqs/xzuB64Ux78qtYsW8tk1TIgGYuLYRU1grL8BVFpEdLU+ikrBVwydvU9x+gSI
	aGg/h9VKN4zNgNNXW64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVHw-00000000IoL-16cE;
	Mon, 11 Nov 2024 14:21:08 +0000
Received: from mail-maxind01on20723.outbound.protection.outlook.com ([2a01:111:f403:2020::723] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVHp-00000000Ilv-3gCx
	for linux-snps-arc@lists.infradead.org;
	Mon, 11 Nov 2024 14:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5A+AltWq5uPrJPizG0BEPb9IFzRkf7irOXs0PdG/aOFz8J3twv3fMm8rFPABHjnJiI4voeEQ86UFnZZd4Rt7TDac5Pq6JG9+KX6y295RsacZNVGUTm4KhkYvvH4t9mTIZMKP5BPzIu/j+480y/6IWaJFFexVqV1oAHdaRS9rCYCl5Cf9R8xeIsCqzMdKLvQbttr/PeshhtpAdftsIbyUPtUVRG0Tt8lpKXyw8UqWkQdzwp4ldK+6db+NDNOg6LdzCmB4YwLrJERjbIkQTdWR6q6idxvl/Qr3++is14TLD6CmutmY5xSxJo68PCJ4Ymqc2F/9zh++/0Jzz/keudyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WewQNG2B59JN1cPK2SxdXDQhc9FH6uQnau2ayvVhwA8=;
 b=c+JBiOjj2I23/N50HZmIhhdQ8ZWEVpW5hcd6DgwDU7dAMraIK/QHpybRMqkGVgINJhoBb1Z1jZchCaIiiMNPMihuQl48r81MKWtUo11h3uMZdh6sUh4ZDtnLGGsISWhinEsO5Y/pJiURUkKjasyxYo21ffWEdlcCxmjcd/9wULyih8mQOW1oT7vZjfB5MwS1Pld5KxrARXFVR0njCwVwYioMImVS+TySNzywolo/Bd5GfoR0YJ+w0xLz/FeylT50Tlf4KtWkoaTtqj0gaHH7getruZET4cKz9O1rzxsS/G9t8KEkt+Nl2npNo/YkVGV5rKUuWc+9L/gBvMqOyMpq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2843.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:204::8)
 by PN3P287MB1587.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 14:20:49 +0000
Received: from PN0P287MB2843.INDP287.PROD.OUTLOOK.COM
 ([fe80::1134:92d7:1f68:2fac]) by PN0P287MB2843.INDP287.PROD.OUTLOOK.COM
 ([fe80::1134:92d7:1f68:2fac%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 14:20:49 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: ast@kernel.org,
	andrii@kernel.org
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Vineet Gupta <vgupta@kernel.org>,
	bpf@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: bpf_jit_arcv2: Remove redundant condition check
Date: Mon, 11 Nov 2024 19:49:47 +0530
Message-ID: <20241111142028.67708-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::20) To PN0P287MB2843.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:204::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2843:EE_|PN3P287MB1587:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f786db-52ef-4aa6-db74-08dd025c0a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4tliVbPSmhlprhlKKnKMTDx7PF/Jjg2gJiJuiLSVIxOsM0pvrAjxTN0xO379?=
 =?us-ascii?Q?BKcVNnaNxVRrnQgL1j1oCB/oOaxVTYDyMOmWqKHYJABFIK+40VGxVBWwkwTO?=
 =?us-ascii?Q?ewwckx0/vstwlUE2VqczMZwjKkz5+QOYpr9nhp97jujeoFaSLZV0cs+7aMxj?=
 =?us-ascii?Q?60hWS8TsK2amauICmZFzsfcIHLGvh7GoHl3QIP8Z6Vf+7CRqQ9qeb2LBX+QZ?=
 =?us-ascii?Q?nJ/jzx9ENBZjm/YkT5i14D0vDuqg3yjWEtmpUdQKiXFi/VygUdQo2+Pq7Qra?=
 =?us-ascii?Q?cR+L2qDgltRlN7JiBWkluAJ8tubVAnplCidMn2484GNctDaXjth5wJGbTV4B?=
 =?us-ascii?Q?yJgXHRUnhJKqvGxMVGA7ap5U5k6ysxG9ZeKOQmm57EyfW98pRJspXsov5Fga?=
 =?us-ascii?Q?rTVuMqgJMjQi3cl4D6CDzLF9hh4z3hw0CjPAr7GFxaLHuQNSiGPItZvF862L?=
 =?us-ascii?Q?0whKHdxzVFcXSYH3WY9w/z3eE5PXkTFupkc8et50tTG3YW/FmA97K9LtS1NE?=
 =?us-ascii?Q?q3DDtOGmB3giRhmy/yimBdlJXh/hFVhK2cAw2PYFYtvBGgjsGlUMfi5Ff8zC?=
 =?us-ascii?Q?399HVTQcbUWbmJsYr1Wu7TuM2x6Y+x86u0rvjtHgKGYcUFUErDkVf57Dt30Z?=
 =?us-ascii?Q?LhinbktzDp66t92DCHeJlC+0dmU2an0cPiTBjISybiSXjn7xrZGVoBOFfGzl?=
 =?us-ascii?Q?bFwGrHSGolB4DYSxPAdo3eBUoOS9aO7Ih6kv5dWGzJKDdJVp66PO9J2PlgW7?=
 =?us-ascii?Q?H21aG2IEKJw2IJB41L7z7ukb5dQOgTx7loijQudOzj096pROqMq1QZEaJxHF?=
 =?us-ascii?Q?s6hbsUyroc3AkND33Dd/NgeeW34k3o8snLjfYHUGMGxG75cLm7vZKPC0xY1c?=
 =?us-ascii?Q?F2moBua9zYcWrk1iwjVmgePE+CGvA70JvLcNGIJvYU8hb/kxDariJvZIkJlv?=
 =?us-ascii?Q?vfN2UZVuPgrktFNg95ubnO0XCt8EWKOQMJMz6VXa7PNnN2GOoOV5o/0bxO9R?=
 =?us-ascii?Q?S40VZ35gU6FY8RRrG+rVLUOKnvLAjyqtakVif4CRBXvemvwFUH8RwSUP5L5v?=
 =?us-ascii?Q?kB36fteaJPXhQU/s2JAfGQK3g1ADwPIdnrssxw6qdkwJ2kPugcsPlJruoWRQ?=
 =?us-ascii?Q?GXoLbbkkvOvSPwTCue9pgxiKvV8aCCMvsPcvBkHvWIFEvuik5z3AnVIAmwU3?=
 =?us-ascii?Q?zb7nnwO5jYIbl6J9XiDjs5unaBhAiuHK0U57q3DQLNmQEJLUTmUxfT5FuzDN?=
 =?us-ascii?Q?5nqY371XE57+IwfcDZIeyQ7YN9hEYq1wox1PQqhN2qP/ERgrBSL4dz0IbGEU?=
 =?us-ascii?Q?pS5IVhE0P2N22rrTD2iPU40QVWlEcLALLijVa6EMMY3585BLnxTQXVMClXS7?=
 =?us-ascii?Q?7pCX6XU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2843.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7UIgS8b8yuUCXtxh8FcIj0B7Y5vmodSL1p5N31xUvJtd/Vo/k7Lq7fVByB+c?=
 =?us-ascii?Q?FaMJ/+/Eb8PXNbIrzoJ1TdiI8dcecY5DZQE2TSIUIz8hIm39LzOqid0Prgiz?=
 =?us-ascii?Q?x6vLK78ISGmNKyxnPzJnRTCbM4jbuDeFbkHXL0OlbPD9Rjh8fkQwzByevj7y?=
 =?us-ascii?Q?0jN75lLk3WtffzWaWv1iayangtZln2KwNT3M70zx7hYFJPR2mhHAZbbDrnQv?=
 =?us-ascii?Q?BbPqyB7nTnO8p8N3iLqoOKn5hPOtpLOkfA1gAuJUmV7vCLOPl0k22ukjeWbz?=
 =?us-ascii?Q?SPobdWJ4D3p9/k+zF9oDYdl8ntXoPUeuJWGlNlBHa33JDg6sVgZodBhq9V+L?=
 =?us-ascii?Q?BYIsXUvHLKoVrdgQ9P/EjZ9CD5SnuW3Gd88qdC6qzUF1C1BcwO3+MAriyVap?=
 =?us-ascii?Q?ZMb+h+iCa+GMN4ZnzdWQjApEWNKTVsZiansto5rstd2jwx4Xg6WaHQV0zdK3?=
 =?us-ascii?Q?18ZEUGA4es4Alua01AMMEzIdsgrNCUjCvAHKXjwMlGNRxF4coUW+4TYiBN/d?=
 =?us-ascii?Q?bc++smbjDHG0B0mLjuKsNMuknrAY+aFSUVJXOR6z0oFChWGzIJBwldmYxmAl?=
 =?us-ascii?Q?RQfqsUhyVghFnDIrLERJ/3MY6UsQaO13rTIrKWr3ExK/d0pbbKh92lgJm7B9?=
 =?us-ascii?Q?eMeMDYKcxDnxbLdyZK1E/qeS8/t4MXsyBVn5ajdqbpBFf0LSIySkR1VsA5zp?=
 =?us-ascii?Q?e3XYa5uRdTmtYJcdBaLBpIEBde+8m5LHNYraMWkjvqXPzOpt1J7VxJz48OTh?=
 =?us-ascii?Q?WxzXOsDdHbwAAmcaawU73qyM6fC8gTpxRWrriC62Sdb6MYs0K2a/BFtmR/lx?=
 =?us-ascii?Q?xnTPQaZoyzoleTrgiq6k7c31HibJ4xQxUc2/tW+W23bg0/TRI+VlBQLW8RGF?=
 =?us-ascii?Q?NsodvmvPJvfgDP9oOberlm3IUue3Q8cKZXTK8htG/l6WsE4MWaZyonuF/hEG?=
 =?us-ascii?Q?qsa2ihh9W/wCioZYLgVtX1f1bxWCgIERJFRvWJhcaPAaR23coav9vx/afw/L?=
 =?us-ascii?Q?phPvuoHo4IQR3VfHP8bxskuBbeT9lWPtmX1d/Kq/qKd9Ik7ZjPJbIfM0+pFq?=
 =?us-ascii?Q?3OOY5pfGmIV++AiADHHtV7f1knkydlzW30eR4mhGmdAHHCcPk3ZiXx+fqlvI?=
 =?us-ascii?Q?FeAGDvjDDeEg9gBgUXCFhdhw6ZI8rSZkg/lZjX4y52TL90RKhS/T1z9mEsHB?=
 =?us-ascii?Q?fGCi9q8b/kbu093j5tbcPiZhsU3kXWTuhB+u5FhB/D/bBd58853qgpncE4zv?=
 =?us-ascii?Q?r3vcgnULDclZB7xPHlmAvZopLDeAdSK+mBG8oZkbVGhmMNtio4CymkVEvv7E?=
 =?us-ascii?Q?3yau9578kvcjOYIxO102ZRQZY4zo2XMPPwWk6o6jTvjFaeX7wRJ0QEaddkVk?=
 =?us-ascii?Q?ZbnYtDmJzoyAKOAjPdVkvtJXPHsc0Wb966OtOuTkS1rZZ5dWoNQVPAwfvHte?=
 =?us-ascii?Q?HpOtBXVySULaKTTGsboihBu00Vhvird1hi3WKxG/n5QeTmv7kAQJIXm12MDC?=
 =?us-ascii?Q?5BdjcXDHyD0GDF4qNDwp4Y3pqQS481mrmDgXXBYgQQ0DzCrHckBLuB6uoojT?=
 =?us-ascii?Q?aVxBZDJdbsRqLyiDiirEoykp2elWX8uch24tAe8dCgvq4+YefRoWE9q+Je46?=
 =?us-ascii?Q?93X/yVVrZXB6Vh9JD7YztcM/YS4UeyPovYzYDYtAONsI?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f786db-52ef-4aa6-db74-08dd025c0a5b
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2843.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 14:20:49.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtZUtJGYZbmC4Ajnx9SSw7ugDfZFp7sf+SF2xMUhos0uJ+wRYmKzM/ucL6WXmGF8vPqJBxKonA386vYh3Xkl6Nf3EwZkXuCvnKAiid8F3HZ+ElmiSnfN8X5DIBPt9/N2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_062101_924125_8025706B 
X-CRM114-Status: UNSURE (   8.03  )
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

The condition 'if (ARC_CC_AL)' is always true, as ARC_CC_AL is a constant 
integer. This makes the check redundant, so it is safe to remove.

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 arch/arc/net/bpf_jit_arcv2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 4458e409ca0a..19792ce952be 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -2916,10 +2916,7 @@ bool check_jmp_32(u32 curr_off, u32 targ_off, u8 cond)
 	addendum = (cond == ARC_CC_AL) ? 0 : INSN_len_normal;
 	disp = get_displacement(curr_off + addendum, targ_off);
 
-	if (ARC_CC_AL)
-		return is_valid_far_disp(disp);
-	else
-		return is_valid_near_disp(disp);
+	return is_valid_far_disp(disp);
 }
 
 /*
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
